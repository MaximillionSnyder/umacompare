import 'package:flutter/material.dart';
import '../../../core/theme/uma_colors.dart';
import '../../../core/constants/effects_list.dart';
import '../../../shared/widgets/type_badge.dart';
import '../../../shared/widgets/rarity_badge.dart';
import '../../../shared/widgets/effect_bar.dart';
import '../domain/support_card_model.dart';

class CardDetailScreen extends StatelessWidget {
  final SupportCard card;

  const CardDetailScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final typeColor = UmaColors.typeColor(card.type);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.compare_arrows),
            onPressed: () {
              Navigator.pushNamed(context, '/compare');
            },
            tooltip: 'Go to Compare',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(typeColor),
            _buildInfoSection(),
            _buildEffectsSection(),
            _buildExtraSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color typeColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            typeColor.withOpacity(0.3),
            UmaColors.bg,
          ],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: typeColor.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: card.image.startsWith('assets/')
                  ? Image.asset(card.image, fit: BoxFit.contain)
                  : Container(
                      color: UmaColors.cardElevated,
                      child: const Icon(Icons.image,
                          size: 80, color: UmaColors.textMuted),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Text(
            card.name,
            style: const TextStyle(
              color: UmaColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            card.title,
            style: const TextStyle(
              color: UmaColors.textSecondary,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TypeBadge(type: card.type, fontSize: 13),
              const SizedBox(width: 10),
              RarityBadge(rarity: card.rarity),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEffectsSection() {
    final typeColor = UmaColors.typeColor(card.type);
    final effects = card.effects.entries.toList();
    if (effects.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: UmaColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.06)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Training Effects',
              style: TextStyle(
                color: UmaColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${effects.length} effects',
              style: const TextStyle(
                color: UmaColors.textMuted,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            ...effects.map((e) {
              final maxVal = e.value > 100 ? e.value : 100;
              return EffectBar(
                emoji: EffectLabels.emoji(e.key),
                label: EffectLabels.label(e.key),
                value: e.value,
                maxValue: maxVal,
                color: typeColor,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildExtraSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (card.uniqueEffect != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: UmaColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: UmaColors.accent.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '✨ Unique Effect',
                    style: TextStyle(
                      color: UmaColors.accent,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    card.uniqueEffect!,
                    style: const TextStyle(
                      color: UmaColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (card.skills.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: UmaColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.06)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Skills',
                    style: TextStyle(
                      color: UmaColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...card.skills.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: UmaColors.typeColor(card.type),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                s,
                                style: const TextStyle(
                                  color: UmaColors.textSecondary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/compare'),
                  icon: const Icon(Icons.compare_arrows, size: 18),
                  label: const Text('Compare'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/decks'),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add to Deck'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
