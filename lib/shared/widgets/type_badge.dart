import 'package:flutter/material.dart';
import '../../../core/theme/uma_colors.dart';

class TypeBadge extends StatelessWidget {
  final String type;
  final double fontSize;

  const TypeBadge({super.key, required this.type, this.fontSize = 11});

  @override
  Widget build(BuildContext context) {
    final color = UmaColors.typeColor(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Text(
        '${UmaColors.typeEmoji(type)} ${UmaColors.typeLabel(type)}',
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
