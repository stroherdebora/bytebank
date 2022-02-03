import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/dashboard/balance_card.dart';
import 'package:bytebank/screens/deposit/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardStates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          Consumer<Saldo>(builder: (context, value, child) {
            return ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }));
                },
                child: Text('Receber depósito'));
          })
        ],
      ),
    );
  }
}
