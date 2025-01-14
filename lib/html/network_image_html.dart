import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:web/web.dart';

final String _key = 'image_web';
final CacheManager _cacheManager = CacheManager(
  Config(
    _key,
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 20,
    repo: JsonCacheInfoRepository(databaseName: _key),
    fileSystem: IOFileSystem(_key),
    fileService: HttpFileService(),
  ),
);

class NetworkImagePlus extends StatelessWidget {
  const NetworkImagePlus({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.errorBuilder,
    this.fit,
    this.isCircle = false,
  });

  final String url;
  final double? width;
  final double? height;
  final ImageErrorWidgetBuilder? errorBuilder;
  final BoxFit? fit;
  final bool isCircle;

  // void function(Event event) {
  //   allowInterop((Event event) {
  //     debugPrint('NetworkImagePlus: onError event - $event');
  //     errorBuilder?.call(context, event, null);
  //   })
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FutureBuilder(
        future: _cacheManager.getSingleFile(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HtmlElementView.fromTagName(
              tagName: 'img',
              onElementCreated: (Object element) {
                try {
                  final img = element as HTMLImageElement;
                  img.src = url;
                  img.style.width = width != null ? '${width}px' : 'auto';
                  img.style.height = height != null ? '${height}px' : 'auto';
                  img.style.marginLeft = 'auto';
                  img.style.marginRight = 'auto';
                  img.style.display = 'block';
                  img.style.objectFit = fit?.toCssName ?? 'fill';
                  if (isCircle) {
                    img.style.borderRadius = '50%';
                  }
                } catch (e) {
                  debugPrint('NetworkImagePlus: $e');
                }
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Icon(Icons.error),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

extension _FitType on BoxFit {
  String get toCssName {
    switch (this) {
      case BoxFit.fill:
        return 'fill';
      case BoxFit.contain:
        return 'contain';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fitWidth:
        return 'fit-width';
      case BoxFit.fitHeight:
        return 'fit-height';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'scale-down';
    }
  }
}
