import 'package:masar/app_Imports.dart';
class ImageModel extends GetxController {
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  void setImageFile(XFile? file) {
    imageFile.value = file;
  }
  String? get imagePath {
    return imageFile.value?.path;
  }
}
