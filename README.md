<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Network Image Plus is a Flutter package that allows you to rendered images on the web using CanvasKit without CORS issues.

## Features

This plugin uses `HtmlElementView` to create an `img` element and set the src to the url provided.
If the plugin is running on a io platform, it will use the regular `Image.network` widget.

## Getting started

Add `network_image_plus` as a dependency in your `pubspec.yaml` file.
```yaml
network_image_plus: ^1.0.6
```
or install it using the command
```shell
flutter pub add network_image_plus
```

## Usage

Import the package in your dart file

```dart
import 'package:network_image_plus/network_image_plus.dart';

const image = NetworkImagePlus(
  url: 'https://example.com/image.png',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
);
```
