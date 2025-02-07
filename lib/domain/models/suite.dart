import 'category_item.dart';
import 'period.dart';

class Suite {
  final String nome;
  final List<String> fotos;
  final List<CategoryItem> categoriaItens;
  final List<Period> periodos;
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
          .map((item) => CategoryItem.fromJson(item))
          .toList(),
      periodos: (json['periodos'] as List)
          .map((periodo) => Period.fromJson(periodo))
          .toList(),
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] ?? false,
    );
  }
}
