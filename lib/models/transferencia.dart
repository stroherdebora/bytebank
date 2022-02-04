class Transferencia {
  final int conta;
  final double valor;

  Transferencia(
    this.valor,
    this.conta,
  );

  @override
  String toString() => 'Transferência (conta: $conta, valor: $valor)';
}
