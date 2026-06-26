import 'package:flutter/material.dart';
import '../../../core/theme/uma_colors.dart';

class MyDecksScreen extends StatelessWidget {
  const MyDecksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Decks')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_awesome_mosaic,
                size: 64, color: UmaColors.textMuted.withOpacity(0.3)),
            const SizedBox(height: 16),
            const Text(
              'No decks yet',
              style: TextStyle(color: UmaColors.textMuted, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create your first support card deck',
              style: TextStyle(color: UmaColors.textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/deck/new'),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Create Deck'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/deck/new'),
        icon: const Icon(Icons.add),
        label: const Text('New Deck'),
      ),
    );
  }
}
