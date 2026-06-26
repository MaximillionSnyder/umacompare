import 'package:flutter/material.dart';

class UmaColors {
  UmaColors._();

  static const bg = Color(0xFF0A0A0F);
  static const surface = Color(0xFF12121A);
  static const card = Color(0xFF1A1A2E);
  static const cardElevated = Color(0xFF222240);

  static const accent = Color(0xFF7C3AED);
  static const accentCyan = Color(0xFF06B6D4);

  static const textPrimary = Color(0xFFF8FAFC);
  static const textSecondary = Color(0xFF94A3B8);
  static const textMuted = Color(0xFF64748B);

  static const glowPurple = Color(0x807C3AED);

  static const speed = Color(0xFF3B82F6);
  static const speedGlow = Color(0x403B82F6);
  static const stamina = Color(0xFFEF4444);
  static const staminaGlow = Color(0x40EF4444);
  static const power = Color(0xFFF97316);
  static const powerGlow = Color(0x40F97316);
  static const guts = Color(0xFFEAB308);
  static const gutsGlow = Color(0x40EAB308);
  static const wit = Color(0xFF22C55E);
  static const witGlow = Color(0x4022C55E);
  static const friend = Color(0xFFA855F7);
  static const friendGlow = Color(0x40A855F7);

  static const raritySSR = Color(0xFFF59E0B);
  static const raritySR = Color(0xFFA855F7);
  static const rarityR = Color(0xFF9CA3AF);

  static const barBg = Color(0xFF2A2A3E);
  static const barFill = Color(0xFF7C3AED);

  static Color typeColor(String type) {
    switch (type) {
      case 'speed':
        return speed;
      case 'stamina':
        return stamina;
      case 'power':
        return power;
      case 'guts':
        return guts;
      case 'wit':
        return wit;
      case 'friend':
        return friend;
      default:
        return accent;
    }
  }

  static Color typeGlow(String type) {
    switch (type) {
      case 'speed':
        return speedGlow;
      case 'stamina':
        return staminaGlow;
      case 'power':
        return powerGlow;
      case 'guts':
        return gutsGlow;
      case 'wit':
        return witGlow;
      case 'friend':
        return friendGlow;
      default:
        return glowPurple;
    }
  }

  static Color rarityColor(String rarity) {
    switch (rarity) {
      case 'ssr':
        return raritySSR;
      case 'sr':
        return raritySR;
      case 'r':
        return rarityR;
      default:
        return textMuted;
    }
  }

  static String typeEmoji(String type) {
    switch (type) {
      case 'speed':
        return '⚡';
      case 'stamina':
        return '🛡️';
      case 'power':
        return '💪';
      case 'guts':
        return '🔥';
      case 'wit':
        return '🧠';
      case 'friend':
        return '💜';
      default:
        return '⬡';
    }
  }

  static String typeLabel(String type) {
    switch (type) {
      case 'speed':
        return 'Speed';
      case 'stamina':
        return 'Stamina';
      case 'power':
        return 'Power';
      case 'guts':
        return 'Guts';
      case 'wit':
        return 'Wit';
      case 'friend':
        return 'Friend';
      default:
        return type;
    }
  }

  static String rarityLabel(String rarity) {
    switch (rarity) {
      case 'ssr':
        return 'SSR';
      case 'sr':
        return 'SR';
      case 'r':
        return 'R';
      default:
        return rarity.toUpperCase();
    }
  }
}
