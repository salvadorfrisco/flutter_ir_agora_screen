class CategoryItem {
  final String nome;
  final String icone;

  CategoryItem({
    required this.nome,
    required this.icone,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      nome: json['nome'],
      icone: json['icone'],
    );
  }
}
