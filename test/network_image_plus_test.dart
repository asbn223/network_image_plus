import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_plus/network_image_plus.dart';

void main() {
  test('Displays a NetworkImagePlus', () {
    const image = NetworkImagePlus(
      url: 'https://example.com/image.png',
      width: 100,
      height: 100,
    );

    expect(image.url, 'https://example.com/image.png');
    expect(image.width, 100);
    expect(image.height, 100);
    expect(image, isA<NetworkImagePlus>());
  });
}
