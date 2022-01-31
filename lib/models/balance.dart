import 'package:flutter/foundation.dart';

class Saldo extends ChangeNotifier {
  double value;
  Saldo(this.value);

  void addValue(double value) {
    this.value += value;
  }

  @override
  String toString() {
    return 'R\$ $value';
  }
}
