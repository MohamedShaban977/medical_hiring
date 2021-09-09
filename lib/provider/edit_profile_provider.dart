import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
  bool isEdit = false;

  changeEdit() {
    isEdit = !isEdit;
    notifyListeners();
  }
}
