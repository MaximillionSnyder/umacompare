import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/uma_colors.dart';
import '../../catalog/presentation/catalog_provider.dart';

class DeckBuilderScreen extends ConsumerStatefulWidget {
  final String? deckId;
  const DeckBuilderScreen({super.key, this.deckId});

  @override
  ConsumerState<DeckBuilderScreen> createState() => _DeckBuilderScreenState();
}

class _DeckBuilderScreenState extends ConsumerState<DeckBuilderScreen> {
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final List<String> _selectedIds = [];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardsAsync = ref.watch(cardsProvider);
    final allCards = cardsAsync.valueOrNull ?? [];
    final selectedCards =
        allCards.where((c) => _selectedIds.contains(c.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckId != null ? 'Edit Deck' : 'New Deck'),
        actions: [
          if (_selectedIds.isNotEmpty)
            TextButton(
              onPressed: _saveDeck,
              child: const Text('Save'),
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Deck Name',
                    prefixIcon: Icon(Icons.edit),
                  ),
                  style: const TextStyle(color: UmaColors.textPrimary),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _descCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                    prefixIcon: Icon(Icons.description),
                  ),
                  style: const TextStyle(color: UmaColors.textPrimary),
                ),
              ],
            ),
          ),
          if (selectedCards.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedCards.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final card = selectedCards[index];
                    final typeColor = UmaColors.typeColor(card.type);
                    return GestureDetector(
                      onTap: () => setState(
                          () => _selectedIds.remove(card.id)),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: typeColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: typeColor.withOpacity(0.4)),
                        ),
                        child: Center(
                          child: Text(
                            card.name.substring(0, 3),
                            style: TextStyle(
                              color: typeColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Selected: ${_selectedIds.length}/6',
                  style: const TextStyle(color: UmaColors.textSecondary),
                ),
                const Spacer(),
                if (_selectedIds.isNotEmpty)
                  TextButton(
                    onPressed: () => setState(() => _selectedIds.clear()),
                    child: const Text('Clear all'),
                  ),
              ],
            ),
          ),
          const Divider(color: UmaColors.textMuted),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.1,
              ),
              itemCount: allCards.length,
              itemBuilder: (context, index) {
                final card = allCards[index];
                final isSelected = _selectedIds.contains(card.id);
                final typeColor = UmaColors.typeColor(card.type);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedIds.remove(card.id);
                      } else if (_selectedIds.length < 6) {
                        _selectedIds.add(card.id);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? typeColor.withOpacity(0.15)
                          : UmaColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? typeColor
                            : Colors.white.withOpacity(0.06),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          card.name,
                          style: TextStyle(
                            color: isSelected
                                ? typeColor
                                : UmaColors.textSecondary,
                            fontSize: 13,
                            fontWeight:
                                isSelected ? FontWeight.w700 : FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${UmaColors.typeLabel(card.type)} · ${UmaColors.rarityLabel(card.rarity)}',
                          style: const TextStyle(
                              color: UmaColors.textMuted, fontSize: 11),
                        ),
                        if (isSelected)
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(Icons.check_circle,
                                color: UmaColors.accent, size: 20),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _saveDeck() {
    if (_nameCtrl.text.trim().isEmpty) return;
    Navigator.pop(context);
  }
}
