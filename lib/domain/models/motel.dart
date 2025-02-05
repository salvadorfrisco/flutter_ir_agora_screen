import 'suite.dart';

class Motel {
  final String logo;
  final String fantasia;
  final num distancia;
  final String bairro;
  final num media;
  final int qtdAvaliacoes;
  final List<Suite> suites;
  bool isFavorito;

  Motel({
    required this.logo,
    required this.fantasia,
    required this.distancia,
    required this.bairro,
    required this.media,
    required this.qtdAvaliacoes,
    required this.suites,
    this.isFavorito = false,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    final motelData = json['data']['moteis'][0];
    return Motel(
      logo: motelData['logo'],
      fantasia: motelData['fantasia'] ?? '',
      distancia: motelData['distancia'] ?? '',
      bairro: motelData['bairro'],
      media: motelData['media'],
      qtdAvaliacoes: motelData['qtdAvaliacoes'] ?? 0,
      suites: (motelData['suites'] as List)
          .map((suite) => Suite.fromJson(suite))
          .toList(),
    );
  }
}
