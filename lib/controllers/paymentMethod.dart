import 'package:flutter/material.dart';

class PaymentMethod extends ChangeNotifier {
  bool _value = true;

  bool get value => _value;

  void updateValue(bool newValue) {
    _value = newValue;
    notifyListeners();
  }
}
