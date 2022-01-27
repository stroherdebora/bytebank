import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final Saldo balance;

  const BalanceCard(this.balance);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        balance.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
