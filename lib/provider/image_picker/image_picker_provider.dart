import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  File image;
  final imagePicker = ImagePicker();

  Future getImage(ImageSource src) async {
    final pickedFile = await imagePicker.getImage(source: src);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    notifyListeners();
  }
}
