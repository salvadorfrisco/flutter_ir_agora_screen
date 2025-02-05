import 'package:flutter/material.dart';
import '../../../domain/models/categoria_item.dart';
import '../../core/widgets/lowercase_text.dart';

class ItensCategoryCard extends StatelessWidget {
  final List<CategoriaItem> itens;

  const ItensCategoryCard({super.key, required this.itens});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...itens.take(4).map(_buildItem),
              _buildVerTodosItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(CategoriaItem item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Image.network(
        item.icone,
        height: 40,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildVerTodosItem() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 4.0,
        bottom: 16.0,
        left: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4.0,
        children: [
          LowercaseText(
            'ver\ntodos',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
