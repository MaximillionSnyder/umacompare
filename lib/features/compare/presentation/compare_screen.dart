import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/uma_colors.dart';
import '../../../core/constants/effects_list.dart';
import '../presentation/compare_provider.dart';

class CompareScreen extends ConsumerWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final compareState = ref.watch(compareProvider);
    final cards = compareState.selectedCards;

    if (cards.length < 2) {
      return Scaffold(
        appBar: AppBar(title: const Text('Compare Cards')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.compare_arrows,
                  size: 64, color: UmaColors.textMuted.withOpacity(0.3)),
              const SizedBox(height: 16),
              const Text(
                'Select at least 2 cards to compare',
                style: TextStyle(color: UmaColors.textMuted, fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go to Catalog'),
              ),
            ],
          ),
        ),
      );
    }

    final allEffectKeys = <String>{};
    for (final card in cards) {
      allEffectKeys.addAll(card.effects.keys);
    }
    final effectKeys = allEffectKeys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Compare (${cards.length})'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => ref.read(compareProvider.notifier).clearAll(),
            tooltip: 'Clear all',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCardHeaders(context, ref, cards),
          const Divider(height: 1, color: UmaColors.textMuted),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'STATS COMPARISON',
                    style: TextStyle(
                      color: UmaColors.accent,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...effectKeys.map((key) {
                    return _buildEffectRow(context, key, cards);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardHeaders(
      BuildContext context, WidgetRef ref, List cards) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: UmaColors.surface,
      child: Row(
        children: cards.map((card) {
          return Expanded(
            child: GestureDetector(
              onTap: () =>
                  ref.read(compareProvider.notifier).removeCard(card.id),
              child: Column(
                children: [
                  Container(
                    height: 140,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: UmaColors.typeColor(card.type).withOpacity(0.4),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: card.image.startsWith('assets/')
                          ? Image.asset(card.image, fit: BoxFit.contain)
                          : Container(
                              color: UmaColors.cardElevated,
                              child: const Icon(Icons.image,
                                  color: UmaColors.textMuted),
                            ),
                    ),
                  ),
                  Text(
                    card.name,
                    style: const TextStyle(
                      color: UmaColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${UmaColors.rarityLabel(card.rarity)} · ${UmaColors.typeLabel(card.type)}',
                    style: const TextStyle(
                      color: UmaColors.textMuted,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap to remove',
                    style: TextStyle(
                      color: UmaColors.stamina.withOpacity(0.5),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEffectRow(BuildContext context, String key, List cards) {
    int bestValue = 0;
    for (final card in cards) {
      final val = card.effects[key] ?? 0;
      if (val > bestValue) bestValue = val;
    }
    final maxVal = bestValue > 100 ? bestValue : 100;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '${EffectLabels.emoji(key)} ${EffectLabels.label(key)}',
              style: const TextStyle(
                color: UmaColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...cards.map((card) {
            final value = card.effects[key] ?? 0;
            final isBest = value == bestValue && value > 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 3, left: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      card.name,
                      style: TextStyle(
                        color: isBest
                            ? UmaColors.typeColor(card.type)
                            : UmaColors.textMuted,
                        fontSize: 12,
                        fontWeight:
                            isBest ? FontWeight.w700 : FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: (value / maxVal).clamp(0.0, 1.0),
                        minHeight: 6,
                        backgroundColor: UmaColors.barBg,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isBest
                              ? UmaColors.typeColor(card.type)
                              : UmaColors.typeColor(card.type)
                                  .withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 50,
                    child: Text(
                      '+$value${value <= 100 ? '%' : ''}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: isBest
                            ? UmaColors.typeColor(card.type)
                            : UmaColors.textMuted,
                        fontSize: 13,
                        fontWeight:
                            isBest ? FontWeight.w800 : FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (isBest)
                    const Icon(Icons.star,
                        size: 14, color: UmaColors.raritySSR),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
