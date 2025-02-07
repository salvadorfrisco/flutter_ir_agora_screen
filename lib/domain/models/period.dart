import 'discount.dart';

class Period {
  final String tempoFormatado;
  final double valor;
  final double valorTotal;
  final Discount? desconto;

  Period({
    required this.tempoFormatado,
    required this.valor,
    required this.valorTotal,
    this.desconto,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      tempoFormatado: json['tempoFormatado'],
      valor: json['valor'].toDouble(),
      valorTotal: json['valorTotal'].toDouble(),
      desconto:
          json['desconto'] != null ? Discount.fromJson(json['desconto']) : null,
    );
  }
}
