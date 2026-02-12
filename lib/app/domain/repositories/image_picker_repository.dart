import 'package:cross_file/cross_file.dart';

abstract class ImagePickerRepository {
  Future<XFile> pickImage();
}
