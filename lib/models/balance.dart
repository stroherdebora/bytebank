import 'package:flutter/foundation.dart';

class Saldo extends ChangeNotifier {
  double value;
  Saldo(this.value);

  void addValue(double value) {
    this.value += value;

    notifyListeners();
  }

  void subValue(double value) {
    this.value -= value;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $value';
  }
}
