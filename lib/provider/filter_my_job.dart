import 'package:flutter/cupertino.dart';

class FilterMyJob extends ChangeNotifier {
  bool all = true, accepted = false, underProgress = false, rejected = false;

  changeIsAll(bool value) {
    all = value;
    accepted = false;
    underProgress = false;
    rejected = false;
    print('Small');

    notifyListeners();
  }

  changeIsAccepted(bool value) {
    all = false;
    accepted = value;
    underProgress = false;
    rejected = false;
    print('Small');

    notifyListeners();
  }

  changeIsUnderProgress(bool value) {
    all = false;
    accepted = false;
    underProgress = value;
    rejected = false;
    print('Small');

    notifyListeners();
  }

  changeIsRejected(bool value) {
    all = false;
    accepted = false;
    underProgress = false;
    rejected = value;
    print('Small');

    print('XLarge');

    notifyListeners();
  }
}
