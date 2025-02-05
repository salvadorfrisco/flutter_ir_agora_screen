import 'package:flutter/material.dart';
import 'lowercase_text.dart';

class DiscountBadge extends StatelessWidget {
  final double originalValue;
  final double discountValue;

  const DiscountBadge({
    super.key,
    required this.originalValue,
    required this.discountValue,
  });

  @override
  Widget build(BuildContext context) {
    final discountPercentage = ((discountValue / originalValue) * 100).round();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: LowercaseText(
        '$discountPercentage% off',
        style: const TextStyle(
          color: Colors.green,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
