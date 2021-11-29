import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaNumeroConta = '0000';

class FormTransferencia extends StatefulWidget {
  FormTransferencia({Key? key}) : super(key: key);

  @override
  _FormTransferenciaState createState() => _FormTransferenciaState();
}

class _FormTransferenciaState extends State<FormTransferencia> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
              controller: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final String valor = _controladorCampoValor.text;
    final transferenciaCriada = Transferencia(valor, numeroConta);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$transferenciaCriada')));
    Navigator.pop(context, transferenciaCriada);
  }
}
