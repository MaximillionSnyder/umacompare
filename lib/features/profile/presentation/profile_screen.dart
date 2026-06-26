import 'package:flutter/material.dart';
import '../../../core/theme/uma_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: UmaColors.accent.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(
                    color: UmaColors.accent.withOpacity(0.4), width: 2),
              ),
              child: const Icon(Icons.person,
                  size: 50, color: UmaColors.accent),
            ),
            const SizedBox(height: 16),
            const Text(
              'Guest Trainer',
              style: TextStyle(
                color: UmaColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Sign in to save your decks',
              style: TextStyle(color: UmaColors.textSecondary),
            ),
            const SizedBox(height: 32),
            _buildStatCard('Decks', '0', Icons.auto_awesome_mosaic),
            const SizedBox(height: 12),
            _buildStatCard('Cards Compared', '0', Icons.compare_arrows),
            const SizedBox(height: 12),
            _buildStatCard('Favorites', '0', Icons.favorite_border),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () =>
                    Navigator.pushNamed(context, '/login'),
                icon: const Icon(Icons.login),
                label: const Text('Sign In / Register'),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: UmaColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          Icon(icon, color: UmaColors.accent, size: 24),
          const SizedBox(width: 16),
          Text(label,
              style: const TextStyle(color: UmaColors.textSecondary)),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: UmaColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
