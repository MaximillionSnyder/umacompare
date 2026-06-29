### Task 8: Update CardDetailScreen for Network Images

**Files:**
- Modify: `lib/features/catalog/presentation/card_detail_screen.dart`

**Changes needed:**
1. Convert StatelessWidget → ConsumerWidget
2. Add imports for `cached_network_image`, `flutter_riverpod`, and `repository_providers`
3. Change `build` signature to accept `WidgetRef ref`
4. Pass `ref` to `_buildHeader`
5. Replace `Image.asset` with `CachedNetworkImage` using `repo.imageUrl(card.image)` in `_buildHeader`

**Detailed steps:**

1. Add these imports:
```dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uma_cards/core/providers/repository_providers.dart';
```

2. Change class from `StatelessWidget` to `ConsumerWidget`

3. Change build signature:
```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
```

4. In build, pass ref to _buildHeader:
```dart
_buildHeader(typeColor, ref),
```

5. In _buildHeader method, add `WidgetRef ref` parameter and get the image URL:
```dart
Widget _buildHeader(Color typeColor, WidgetRef ref) {
    final repo = ref.read(cardRepositoryProvider);
    final imageUrl = repo.imageUrl(card.image);
```

6. Replace the Image.asset section with CachedNetworkImage:
```dart
child: ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.contain,
    placeholder: (_, __) => Container(
      color: UmaColors.cardElevated,
      child: const Icon(Icons.image, size: 80, color: UmaColors.textMuted),
    ),
    errorWidget: (_, __, ___) => Container(
      color: UmaColors.cardElevated,
      child: const Icon(Icons.image, size: 80, color: UmaColors.textMuted),
    ),
  ),
),
```

- [ ] **Verify analyzer**
Run: `C:\flutter\bin\flutter.bat analyze lib/features/catalog/presentation/card_detail_screen.dart`
Expected: No issues

- [ ] **Commit**
```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: update CardDetailScreen to use network images"
```
