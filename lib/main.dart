import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormTransferencia(),
      ),
    );
  }
}

class FormTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Editor(_controladorCampoNumeroConta, 'Número da conta', '0000', null),
          Editor(_controladorCampoValor, 'Valor', '0.00', Icons.monetization_on),
          ElevatedButton(
            onPressed: () {
              debugPrint('clicou no confirmar');
              final String numeroConta = _controladorCampoNumeroConta.text;
              final String valor = _controladorCampoValor.text;
              final transferenciaCriada = Transferencia(valor, numeroConta);
              debugPrint('$transferenciaCriada');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$transferenciaCriada')));
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _rotulo;
  final String _dica;
  final IconData? _icone;

  Editor(
    this._controller,
    this._rotulo,
    this._dica,
    this._icone,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: _icone != null ? Icon(_icone) : null,
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia('100.0', '1001')),
          ItemTransferencia(Transferencia('200.0', '1002')),
          ItemTransferencia(Transferencia('300.0', '1003')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}

class Transferencia {
  final String conta;
  final String valor;

  Transferencia(this.valor, this.conta);

  @override
  String toString() => 'Transferência (conta: $conta, valor: $valor)';
}
