import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/uma_colors.dart';
import '../../../shared/widgets/uma_card_widget.dart';
import '../../../shared/widgets/filter_bar.dart';
import '../../compare/presentation/compare_provider.dart';
import 'catalog_provider.dart';

class CatalogScreen extends ConsumerWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(catalogFilterProvider);
    final cards = ref.watch(filteredCardsProvider);
    final compareState = ref.watch(compareProvider);

    return Column(
      children: [
        FilterBar(
          selectedTypes: filters.types,
          selectedRarities: filters.rarities,
          onTypesChanged: (types) =>
              ref.read(catalogFilterProvider.notifier).setTypes(types),
          onRaritiesChanged: (rarities) =>
              ref.read(catalogFilterProvider.notifier).setRarities(rarities),
          onSearchChanged: (search) =>
              ref.read(catalogFilterProvider.notifier).setSearch(search),
        ),
        Expanded(
          child: Builder(builder: (context) {
            if (cards.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search_off,
                        size: 64, color: UmaColors.textMuted.withOpacity(0.3)),
                    const SizedBox(height: 12),
                    const Text(
                      'No cards found',
                      style: TextStyle(
                        color: UmaColors.textMuted,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(context),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                final isSelected = compareState.selectedCards
                    .any((c) => c.id == card.id);
                return UmaCardWidget(
                  card: card,
                  isSelected: isSelected,
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/card/${card.id}',
                  ),
                  onCompareToggle: () =>
                      ref.read(compareProvider.notifier).toggleCard(card),
                );
              },
            );
          }),
        ),
        if (compareState.selectedCards.isNotEmpty)
          _buildCompareBar(context, ref),
      ],
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 5;
    if (width > 900) return 4;
    if (width > 600) return 3;
    return 2;
  }

  Widget _buildCompareBar(BuildContext context, WidgetRef ref) {
    final compareState = ref.watch(compareProvider);
    return Container(
      decoration: BoxDecoration(
        color: UmaColors.surface,
        border: Border(
          top: BorderSide(color: UmaColors.accent.withOpacity(0.3)),
        ),
        boxShadow: [
          BoxShadow(
            color: UmaColors.accent.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${compareState.selectedCards.length}/${compareState.maxCompare} selected',
                style: const TextStyle(
                  color: UmaColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () => ref.read(compareProvider.notifier).clearAll(),
              child: const Text('Clear',
                  style: TextStyle(color: UmaColors.textMuted)),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: compareState.selectedCards.length >= 2
                  ? () {
                      Navigator.pushNamed(context, '/compare');
                    }
                  : null,
              icon: const Icon(Icons.compare_arrows, size: 18),
              label: const Text('Compare'),
            ),
          ],
        ),
      ),
    );
  }
}
