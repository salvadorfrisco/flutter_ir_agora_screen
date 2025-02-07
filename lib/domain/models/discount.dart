class Discount {
  final double desconto;

  Discount({required this.desconto});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(desconto: json['desconto'].toDouble());
  }
}
