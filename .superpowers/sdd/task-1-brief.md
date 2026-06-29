### Task 1: Create Core Repository Interfaces

**Files:**
- Create: `lib/core/repositories/card_repository.dart`
- Create: `lib/core/repositories/deck_repository.dart`

**Interfaces:**
- Consumes: `SupportCard` from `lib/features/catalog/domain/support_card_model.dart`, `Deck` from `lib/features/decks/domain/deck_model.dart`
- Produces: Abstract repository contracts consumed by all later tasks

- [ ] **Step 1: Create CardRepository abstract class**

```dart
import 'package:uma_cards/features/catalog/domain/support_card_model.dart';

abstract class CardRepository {
  Future<List<SupportCard>> getAll();
  Future<SupportCard?> getById(String id);
  List<SupportCard> filter({
    required List<SupportCard> cards,
    List<String> types = const [],
    List<String> rarities = const [],
    String search = '',
  });
  String imageUrl(String relativePath);
}
```

- [ ] **Step 2: Create DeckRepository abstract class**

```dart
import 'package:uma_cards/features/decks/domain/deck_model.dart';

abstract class DeckRepository {
  Future<List<Deck>> getAll();
  Future<void> save(Deck deck);
  Future<void> delete(String id);
}
```

- [ ] **Step 3: Create directory and write files**

```bash
mkdir -p lib/core/repositories
```

Write both files with the code above.

- [ ] **Step 4: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/core/repositories/`
Expected: No issues (abstract classes, no undefined deps)

- [ ] **Step 5: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add lib/core/repositories/
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add repository abstract interfaces"
```
