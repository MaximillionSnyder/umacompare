class EffectLabels {
  EffectLabels._();

  static const Map<String, String> labels = {
    'friendship_bonus': 'Friendship Bonus',
    'mood_effect': 'Mood Effect',
    'training_effectiveness': 'Training Effectiveness',
    'initial_speed': 'Initial Speed',
    'initial_stamina': 'Initial Stamina',
    'initial_power': 'Initial Power',
    'initial_guts': 'Initial Guts',
    'initial_wit': 'Initial Wit',
    'initial_bond': 'Initial Friendship Gauge',
    'race_bonus': 'Race Bonus',
    'fan_bonus': 'Fan Bonus',
    'speed_bonus': 'Speed Bonus',
    'stamina_bonus': 'Stamina Bonus',
    'power_bonus': 'Power Bonus',
    'guts_bonus': 'Guts Bonus',
    'wit_bonus': 'Wit Bonus',
    'skill_pt_bonus': 'Skill Point Bonus',
    'hint_levels': 'Hint Levels',
    'hint_frequency': 'Hint Frequency',
    'specialty_priority': 'Specialty Priority',
    'wit_recovery': 'Wit Friendship Recovery',
    'event_effectiveness': 'Event Effectiveness',
    'failure_protection': 'Failure Protection',
    'energy_reduction': 'Energy Cost Reduction',
  };

  static const List<String> priorityEffects = [
    'friendship_bonus',
    'training_effectiveness',
    'mood_effect',
    'specialty_priority',
    'speed_bonus',
    'stamina_bonus',
    'power_bonus',
    'guts_bonus',
    'wit_bonus',
  ];

  static String label(String key) => labels[key] ?? key;
  static String emoji(String key) {
    switch (key) {
      case 'friendship_bonus':
        return '💕';
      case 'mood_effect':
        return '😊';
      case 'training_effectiveness':
        return '📈';
      case 'initial_speed':
        return '⚡';
      case 'initial_stamina':
        return '🛡️';
      case 'initial_power':
        return '💪';
      case 'initial_guts':
        return '🔥';
      case 'initial_wit':
        return '🧠';
      case 'initial_bond':
        return '🤝';
      case 'race_bonus':
        return '🏁';
      case 'fan_bonus':
        return '📣';
      case 'speed_bonus':
        return '⚡';
      case 'stamina_bonus':
        return '🛡️';
      case 'power_bonus':
        return '💪';
      case 'guts_bonus':
        return '🔥';
      case 'wit_bonus':
        return '🧠';
      case 'skill_pt_bonus':
        return '⭐';
      case 'hint_levels':
        return '💡';
      case 'hint_frequency':
        return '🔔';
      case 'specialty_priority':
        return '🎯';
      case 'wit_recovery':
        return '💤';
      case 'event_effectiveness':
        return '🎪';
      case 'failure_protection':
        return '🛡️';
      case 'energy_reduction':
        return '🔋';
      default:
        return '📊';
    }
  }
}
