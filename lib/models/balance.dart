import 'package:flutter/foundation.dart';

class Saldo extends ChangeNotifier {
  final double value;
  Saldo(
    this.value,
  );

  @override
  String toString() {
    return 'R\$ $value';
  }
}
