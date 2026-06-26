import 'package:flutter/material.dart';
import '../../../core/theme/uma_colors.dart';

class EffectBar extends StatelessWidget {
  final String label;
  final String emoji;
  final int value;
  final int maxValue;
  final Color? color;
  final bool highlight;

  const EffectBar({
    super.key,
    required this.label,
    required this.emoji,
    required this.value,
    this.maxValue = 100,
    this.color,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final barColor = color ?? UmaColors.accent;
    final pct = (value / maxValue).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: highlight
                        ? UmaColors.textPrimary
                        : UmaColors.textSecondary,
                    fontSize: 13,
                    fontWeight:
                        highlight ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '+$value${value <= 100 ? '%' : ''}',
                style: TextStyle(
                  color: highlight ? barColor : UmaColors.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              height: 6,
              child: LinearProgressIndicator(
                value: pct,
                backgroundColor: UmaColors.barBg,
                valueColor: AlwaysStoppedAnimation<Color>(
                  highlight ? barColor : barColor.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
