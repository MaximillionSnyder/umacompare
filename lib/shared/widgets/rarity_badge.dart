import 'package:flutter/material.dart';
import '../../../core/theme/uma_colors.dart';

class RarityBadge extends StatelessWidget {
  final String rarity;

  const RarityBadge({super.key, required this.rarity});

  @override
  Widget build(BuildContext context) {
    final color = UmaColors.rarityColor(rarity);
    final label = UmaColors.rarityLabel(rarity);
    final stars = rarity == 'ssr' ? '★★★★★' : rarity == 'sr' ? '★★★☆☆' : '★☆☆☆☆';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          Text(
            stars,
            style: TextStyle(
              color: color,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
