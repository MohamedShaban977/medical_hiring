import 'package:flutter/material.dart';

class ProviderDropdown extends ChangeNotifier{


  String selectItem ;
  onChange(String value){
    selectItem =value;
    notifyListeners();
  }
}