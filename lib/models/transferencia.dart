class Transferencia {
  final int conta;
  final double valor;

  Transferencia(
    this.valor,
    this.conta,
  );

  // @override
  // String toString() => 'TransferĂȘncia (conta: $conta, valor: $valor)';

  String toStringValor() {
    return 'R\$ $valor';
  }

  String toStringConta() {
    return 'Conta $conta';
  }
}
