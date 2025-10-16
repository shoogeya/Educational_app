import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../managers/image_model.manager.dart';
class ImagePickerService extends GetxService {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      await Future.delayed(Duration(seconds: 1));
      Get.find<ImageModel>().setImageFile(image);// User canceled taking picture/ User canceled picking image
      return image;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
      return null; // Return null in case of error
    }
  }
  Future<XFile?> pickImageFromCamera() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return null;
      await Future.delayed(Duration(seconds: 1));
      Get.find<ImageModel>().setImageFile(image);/// User canceled taking picture
      return image;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
      return null; // Return null in case of error
    }
  }

  Future<XFile?> showOptions(BuildContext context) async {
    XFile? imageFile;
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('معرض الصور'),
            onPressed: () async {
              Navigator.of(context).pop();
              imageFile = await pickImageFromGallery();
              // Navigator.pop(context, imageFile); // This line can be used if you're using Getx
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('الكاميرا'),
            onPressed: () async {
              Navigator.of(context).pop();
              imageFile = await pickImageFromCamera();
              // Navigator.pop(context, imageFile); // This line can be used if you're using Getx
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'إلغاء',
            // Your text style here
          ),
        ),
      ),
    );

    return imageFile; // Return the picked image file
  }
}
