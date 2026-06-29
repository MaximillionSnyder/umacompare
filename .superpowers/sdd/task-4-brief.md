### Task 4: Create Repository Providers

**Files:**
- Create: `lib/core/providers/repository_providers.dart`

**Interfaces:**
- Consumes: `CardRepository`, `LocalCardRepository`, `DeckRepository`, `LocalDeckRepository`
- Produces: Riverpod providers consumed by screens

- [ ] **Step 1: Write repository_providers.dart**

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uma_cards/core/repositories/card_repository.dart';
import 'package:uma_cards/core/repositories/local_card_repository.dart';
import 'package:uma_cards/core/repositories/deck_repository.dart';
import 'package:uma_cards/core/repositories/local_deck_repository.dart';

final cardRepositoryProvider = Provider<CardRepository>((ref) {
  return LocalCardRepository();
});

final deckRepositoryProvider = Provider<DeckRepository>((ref) {
  return LocalDeckRepository();
});
```

- [ ] **Step 2: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/core/providers/`
Expected: No issues

- [ ] **Step 3: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add lib/core/providers/
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add repository providers"
```
