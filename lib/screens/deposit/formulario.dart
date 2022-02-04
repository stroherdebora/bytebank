import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Receber depósito';
const _dicaCampoValor = '0.00';
const _rotuloCampoValor = 'Valor';
const _textoBotaoConfirma = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaDeposito(context),
              child: Text(_textoBotaoConfirma),
            ),
          ],
        ),
      ),
    );
  }

  _criaDeposito(context) {
    final double? value = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(value);

    if (depositoValido) {
      _atualizaEstado(context, value);
      Navigator.pop(context);
    }
  }

  _validaDeposito(value) {
    final _campoPreenchido = value != null;

    return _campoPreenchido;
  }

  _atualizaEstado(context, value) {
    Provider.of<Saldo>(context, listen: false).addValue(value);
  }
}
