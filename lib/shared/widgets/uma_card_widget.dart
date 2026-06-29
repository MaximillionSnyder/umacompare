import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/uma_colors.dart';
import '../../../core/constants/effects_list.dart';
import '../../../features/catalog/domain/support_card_model.dart';
import 'package:uma_cards/core/providers/repository_providers.dart';
import 'type_badge.dart';
import 'rarity_badge.dart';

class UmaCardWidget extends ConsumerWidget {
  final SupportCard card;
  final VoidCallback? onTap;
  final VoidCallback? onCompareToggle;
  final bool isSelected;

  const UmaCardWidget({
    super.key,
    required this.card,
    this.onTap,
    this.onCompareToggle,
    this.isSelected = false,
  });

  List<MapEntry<String, int>> get _topEffects {
    return card.effects.entries
        .where((e) => EffectLabels.priorityEffects.contains(e.key))
        .take(4)
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeColor = UmaColors.typeColor(card.type);
    final typeGlow = UmaColors.typeGlow(card.type);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: UmaColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? typeColor : typeColor.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: typeGlow,
              blurRadius: isSelected ? 20 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageSection(context, ref, typeGlow),
            _buildInfoSection(context),
            _buildStatsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, WidgetRef ref, Color typeGlow) {
    final repo = ref.read(cardRepositoryProvider);
    final imageUrl = repo.imageUrl(card.image);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  typeGlow.withOpacity(0.3),
                  UmaColors.card,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 150,
                    fit: BoxFit.contain,
                    placeholder: (_, __) => _placeholderImage(),
                    errorWidget: (_, __, ___) => _placeholderImage(),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: RarityBadge(rarity: card.rarity),
          ),
          if (onCompareToggle != null)
            Positioned(
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: onCompareToggle,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? UmaColors.accent.withOpacity(0.8)
                        : Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? UmaColors.accent
                          : Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Icon(
                    isSelected ? Icons.check_circle : Icons.compare_arrows,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.name,
            style: const TextStyle(
              color: UmaColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            card.title,
            style: const TextStyle(
              color: UmaColors.textMuted,
              fontSize: 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          TypeBadge(type: card.type),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    final effects = _topEffects;
    if (effects.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: UmaColors.bg.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: effects.map((e) {
            final label = EffectLabels.label(e.key);
            final value = e.value;
            final pct = (value / 100).clamp(0.0, 1.0);
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Text(
                    EffectLabels.emoji(e.key),
                    style: const TextStyle(fontSize: 11),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: UmaColors.textSecondary,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  SizedBox(
                    width: 40,
                    child: Text(
                      '+$value%',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: UmaColors.typeColor(card.type),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 48,
                    height: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: pct,
                        backgroundColor: UmaColors.barBg,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          UmaColors.typeColor(card.type),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      height: 150,
      width: 120,
      decoration: BoxDecoration(
        color: UmaColors.cardElevated,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.image,
        color: UmaColors.textMuted.withOpacity(0.3),
        size: 48,
      ),
    );
  }
}
