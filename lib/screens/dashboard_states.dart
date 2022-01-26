import 'package:bytebank/components/balance.dart';
import 'package:flutter/material.dart';

class DashboardStates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Balance(),
      ),
    );
  }
}
