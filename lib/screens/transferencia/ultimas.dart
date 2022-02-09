import 'package:bytebank/models/transferencias.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _titulo = 'Últimas transferências';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(builder: (context, transferencias, child) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, indice) {
                return ItemTransferencia(transferencias.transferencias[indice]);
              });
        }),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferencias();
            }));
          },
          child: Text('Transferências'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
      ],
    );
  }
}
