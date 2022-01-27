import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/dashboard/balance_card.dart';
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
        child: BalanceCard(Saldo(10.0)),
      ),
    );
  }
}
