import 'dart:isolate';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img; // The 'image' package
import 'package:flutter/services.dart';

extension StringExtensions on String {
  List<String> slipParagraphs() {
    return split(
      '\n\n',
    ).map((e) => e.trim()).where((element) => element.isNotEmpty).toList();
  }

  Future<Uint8List> bytesFromAsset({
    required int height,
    required int width,
  }) async {
    final ByteData data = await rootBundle.load(this);
    final Uint8List bytes = data.buffer.asUint8List();

    if (kIsWeb) {
      // 1. Web Path: Use Hardware-Accelerated Native Decoding
      final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(
        bytes,
      );
      final ui.ImageDescriptor descriptor = await ui.ImageDescriptor.encoded(
        buffer,
      );

      // Tell the browser to ONLY decode 200x200 pixels.
      // This saves ~60MB of RAM instantly.
      final ui.Codec codec = await descriptor.instantiateCodec(
        targetWidth: width,
        targetHeight: height,
      );

      final ui.FrameInfo frameInfo = await codec.getNextFrame();
      final ui.Image image = frameInfo.image;

      // Convert the native ui.Image back to bytes for your PDF/Storage
      final ByteData? jpgData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      return jpgData!.buffer.asUint8List();
    }

    // 2. Mobile/Desktop Path: Use Isolate with 'image' package
    return Isolate.run(() {
      final image = img.decodeImage(bytes);
      if (image == null) throw Exception('Could not decode image');

      final resized = img.copyResize(
        image,
        width: width,
        height: height,
      );
      return Uint8List.fromList(img.encodeJpg(resized));
    });
  }
}
