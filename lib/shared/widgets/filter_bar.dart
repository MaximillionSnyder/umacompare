import 'package:flutter/material.dart';
import '../../../core/theme/uma_colors.dart';

class FilterBar extends StatefulWidget {
  final List<String> selectedTypes;
  final List<String> selectedRarities;
  final ValueChanged<List<String>> onTypesChanged;
  final ValueChanged<List<String>> onRaritiesChanged;
  final ValueChanged<String> onSearchChanged;

  const FilterBar({
    super.key,
    required this.selectedTypes,
    required this.selectedRarities,
    required this.onTypesChanged,
    required this.onRaritiesChanged,
    required this.onSearchChanged,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  final _searchCtrl = TextEditingController();

  static const _types = ['speed', 'stamina', 'power', 'guts', 'wit', 'friend'];
  static const _rarities = ['ssr', 'sr', 'r'];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: UmaColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchCtrl,
            onChanged: widget.onSearchChanged,
            style: const TextStyle(color: UmaColors.textPrimary),
            decoration: InputDecoration(
              hintText: 'Search cards...',
              prefixIcon:
                  const Icon(Icons.search, color: UmaColors.textMuted),
              suffixIcon: _searchCtrl.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: UmaColors.textMuted),
                      onPressed: () {
                        _searchCtrl.clear();
                        widget.onSearchChanged('');
                      },
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
          const SizedBox(height: 10),
          _buildChipRow(
            label: 'Type',
            items: _types,
            selected: widget.selectedTypes,
            colorFn: UmaColors.typeColor,
            labelFn: UmaColors.typeLabel,
            emojiFn: UmaColors.typeEmoji,
            onToggle: (item) {
              final updated = List<String>.from(widget.selectedTypes);
              updated.contains(item) ? updated.remove(item) : updated.add(item);
              widget.onTypesChanged(updated);
            },
          ),
          const SizedBox(height: 8),
          _buildChipRow(
            label: 'Rarity',
            items: _rarities,
            selected: widget.selectedRarities,
            colorFn: UmaColors.rarityColor,
            labelFn: UmaColors.rarityLabel,
            emojiFn: null,
            onToggle: (item) {
              final updated = List<String>.from(widget.selectedRarities);
              updated.contains(item)
                  ? updated.remove(item)
                  : updated.add(item);
              widget.onRaritiesChanged(updated);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChipRow({
    required String label,
    required List<String> items,
    required List<String> selected,
    required Color Function(String) colorFn,
    required String Function(String) labelFn,
    String Function(String)? emojiFn,
    required void Function(String) onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6, left: 2),
          child: Text(
            label,
            style: const TextStyle(
              color: UmaColors.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: items.map((item) {
            final isSelected = selected.contains(item);
            final color = colorFn(item);
            return GestureDetector(
              onTap: () => onToggle(item),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? color.withOpacity(0.2) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? color.withOpacity(0.6)
                        : color.withOpacity(0.25),
                  ),
                ),
                child: Text(
                  emojiFn != null
                      ? '${emojiFn(item)} ${labelFn(item)}'
                      : labelFn(item),
                  style: TextStyle(
                    color: isSelected ? color : color.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
