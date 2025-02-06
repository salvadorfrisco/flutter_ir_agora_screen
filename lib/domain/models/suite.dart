import 'categoria_item.dart';
import 'periodo.dart';

class Suite {
  final String nome;
  final List<String> fotos;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;
  final int? qtd;
  final bool exibirQtdDisponiveis;

  Suite({
    required this.nome,
    required this.fotos,
    required this.categoriaItens,
    required this.periodos,
    this.qtd,
    this.exibirQtdDisponiveis = false,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      fotos: List<String>.from(json['fotos']),
      categoriaItens: (json['categoriaItens'] as List)
          .map((item) => CategoriaItem.fromJson(item))
          .toList(),
      periodos: (json['periodos'] as List)
          .map((periodo) => Periodo.fromJson(periodo))
          .toList(),
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] ?? false,
    );
  }
}
