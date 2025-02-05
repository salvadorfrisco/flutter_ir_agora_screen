class Desconto {
  final double desconto;

  Desconto({required this.desconto});

  factory Desconto.fromJson(Map<String, dynamic> json) {
    return Desconto(desconto: json['desconto'].toDouble());
  }
}

class Periodo {
  final String tempoFormatado;
  final double valor;
  final double valorTotal;
  final Desconto? desconto;

  Periodo({
    required this.tempoFormatado,
    required this.valor,
    required this.valorTotal,
    this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      valor: json['valor'].toDouble(),
      valorTotal: json['valorTotal'].toDouble(),
      desconto:
          json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null,
    );
  }
}
