import 'package:flutter/material.dart';
import '../../../domain/models/categoria_item.dart';

class ItensCategory extends StatelessWidget {
  final List<CategoriaItem> itens;

  const ItensCategory({super.key, required this.itens});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: itens.map((item) => _buildItem(item)).toList(),
      ),
    );
  }

  Widget _buildItem(CategoriaItem item) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(
          item.icone,
          height: 32,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
