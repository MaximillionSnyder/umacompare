### Task 7: Update UmaCardWidget for Network Images

**Files:**
- Modify: `lib/shared/widgets/uma_card_widget.dart`

**Changes needed:**
1. Convert `StatelessWidget` → `ConsumerWidget`
2. Add imports for `cached_network_image`, `flutter_riverpod`, and `repository_providers`
3. Change `build` signature to accept `WidgetRef ref`
4. Pass `ref` to `_buildImageSection`
5. Replace `Image.asset` with `CachedNetworkImage` using `repo.imageUrl(card.image)`

The existing `pubspec.yaml` already has `cached_network_image: ^3.3.0`.

**Current file content reference** — read the file at `lib/shared/widgets/uma_card_widget.dart` to see the exact current state, then apply these changes:

1. Replace imports at the top:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/uma_colors.dart';
import '../../../core/constants/effects_list.dart';
import '../../../features/catalog/domain/support_card_model.dart';
import 'package:uma_cards/core/providers/repository_providers.dart';
import 'type_badge.dart';
import 'rarity_badge.dart';
```

2. Change class declaration:
```dart
class UmaCardWidget extends ConsumerWidget {
```

3. Change build method signature:
```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
```

4. Pass ref to _buildImageSection:
```dart
_buildImageSection(context, ref, typeGlow),
```

5. Replace _buildImageSection to use CachedNetworkImage:
```dart
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
```

6. Keep `_buildInfoSection`, `_buildStatsSection`, `_placeholderImage` unchanged.

- [ ] **Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/shared/widgets/uma_card_widget.dart`
Expected: No issues

- [ ] **Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: update UmaCardWidget to use network images with CachedNetworkImage"
```
