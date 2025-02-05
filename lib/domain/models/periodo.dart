class Periodo {
  final String tempoFormatado;
  final double valorTotal;

  Periodo({
    required this.tempoFormatado,
    required this.valorTotal,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      valorTotal: json['valorTotal'].toDouble(),
    );
  }
}
