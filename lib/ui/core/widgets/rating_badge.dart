import 'package:flutter/material.dart';
import 'lowercase_text.dart';

class RatingBadge extends StatelessWidget {
  final num rating;

  const RatingBadge({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 6.0,
        right: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 12,
            color: Colors.amber[600],
          ),
          const SizedBox(width: 4),
          LowercaseText(
            rating.toString(),
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
