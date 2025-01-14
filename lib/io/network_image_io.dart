import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class NetworkImagePlus extends StatelessWidget {
  const NetworkImagePlus({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.errorBuilder,
    this.fit,
    this.isCircle = false,
  }) : super();

  final String url;
  final double? width;
  final double? height;
  final Widget? errorBuilder;
  final BoxFit? fit;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              url,
            ),
            fit: fit,
          ),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      errorWidget: (context, url, error) => errorBuilder ?? SizedBox.shrink(),
    );
  }
}
