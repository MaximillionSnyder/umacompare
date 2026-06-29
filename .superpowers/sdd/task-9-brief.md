### Task 9: Update CompareScreen for Network Images

**Files:**
- Modify: `lib/features/compare/presentation/compare_screen.dart`

**Changes needed:**
The CompareScreen already extends `ConsumerWidget` (imports flutter_riverpod and uses WidgetRef). Only the image rendering in `_buildCardHeaders` needs to change from `Image.asset` to `CachedNetworkImage`.

**Step 1: Add import for cached_network_image**
```dart
import 'package:cached_network_image/cached_network_image.dart';
```
And import for repository_providers:
```dart
import 'package:uma_cards/core/providers/repository_providers.dart';
```

**Step 2: Update `_buildCardHeaders` method**
Find the current Image.asset code block:
```dart
child: card.image.startsWith('assets/')
    ? Image.asset(card.image, fit: BoxFit.contain)
    : Container(
        color: UmaColors.cardElevated,
        child: const Icon(Icons.image, color: UmaColors.textMuted),
      ),
```

At the beginning of `_buildCardHeaders`, add:
```dart
final repo = ref.read(cardRepositoryProvider);
```

Replace the image block with:
```dart
child: CachedNetworkImage(
  imageUrl: repo.imageUrl(card.image),
  fit: BoxFit.contain,
  placeholder: (_, __) => Container(
    color: UmaColors.cardElevated,
    child: const Icon(Icons.image, color: UmaColors.textMuted),
  ),
  errorWidget: (_, __, ___) => Container(
    color: UmaColors.cardElevated,
    child: const Icon(Icons.image, color: UmaColors.textMuted),
  ),
),
```

- [ ] **Verify analyzer**
Run: `C:\flutter\bin\flutter.bat analyze lib/features/compare/`
Expected: No issues

- [ ] **Commit**
```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: update CompareScreen to use network images"
```
