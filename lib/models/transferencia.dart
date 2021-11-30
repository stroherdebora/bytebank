class Transferencia {
  final String conta;
  final String valor;

  Transferencia(
    this.valor,
    this.conta,
  );

  @override
  String toString() => 'Transferência (conta: $conta, valor: $valor)';
}
