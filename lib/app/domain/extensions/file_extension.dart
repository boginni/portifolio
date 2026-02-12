import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:path/path.dart' as p;

extension XFileExtension on XFile {
  File get file => File(path);
}

extension FileExtension on File {
  String convertImageFileToBase64String() {
    try {
      final type = p.extension(path).replaceAll('.', '');

      final decodeBit = base64Encode(readAsBytesSync());
      return 'data:image/$type;base64,$decodeBit';
    } catch (e) {
      throw Exception('Erro ao converter imagem');
    }
  }

  Uint8List extractDecodeBitAndConvertToUint8List(String? base64Image) {
    if (base64Image == null) {
      return Uint8List(0);
    }

    final commaIndex = base64Image.indexOf(',');

    final base64EncodedData = base64Image.substring(commaIndex + 1);

    return base64Decode(base64EncodedData);
  }
}
