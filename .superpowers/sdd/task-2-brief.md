### Task 2: Create LocalCardRepository Implementation

**Files:**
- Create: `lib/core/repositories/local_card_repository.dart`
- Delete: `lib/features/catalog/data/cards_repository.dart` (replaced)

**Interfaces:**
- Consumes: `CardRepository` interface from Task 1, `SupportCard.fromJson`
- Produces: Concrete repository for pre-prod phase

- [ ] **Step 1: Write LocalCardRepository**

```dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uma_cards/features/catalog/domain/support_card_model.dart';
import 'card_repository.dart';

class LocalCardRepository implements CardRepository {
  List<SupportCard>? _cached;

  @override
  Future<List<SupportCard>> getAll() async {
    if (_cached != null) return _cached!;
    final jsonStr = await rootBundle.loadString('assets/cards.json');
    final List<dynamic> jsonList = json.decode(jsonStr);
    _cached = jsonList.map((j) => SupportCard.fromJson(j)).toList();
    return _cached!;
  }

  @override
  Future<SupportCard?> getById(String id) async {
    final cards = await getAll();
    try {
      return cards.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  List<SupportCard> filter({
    required List<SupportCard> cards,
    List<String> types = const [],
    List<String> rarities = const [],
    String search = '',
  }) {
    return cards.where((c) {
      if (types.isNotEmpty && !types.contains(c.type)) return false;
      if (rarities.isNotEmpty && !rarities.contains(c.rarity)) return false;
      if (search.isNotEmpty &&
          !c.name.toLowerCase().contains(search.toLowerCase())) return false;
      return true;
    }).toList();
  }

  @override
  String imageUrl(String relativePath) {
    // Pre-prod: served by HTTP server from build/web/assets/images/
    return 'http://localhost:8080/assets/images/$relativePath';
  }
}
```

- [ ] **Step 2: Delete old CardsRepository**

```bash
Remove-Item -LiteralPath "lib/features/catalog/data/cards_repository.dart"
```

- [ ] **Step 3: Remove empty data directory**

```bash
Remove-Item -LiteralPath "lib/features/catalog/data" -ErrorAction SilentlyContinue
```

- [ ] **Step 4: Verify analyzer**

Run: `C:\flutter\bin\flutter.bat analyze lib/core/repositories/local_card_repository.dart`
Expected: No issues

- [ ] **Step 5: Commit**

```bash
C:\flutter\bin\mingit\cmd\git.exe add -A
C:\flutter\bin\mingit\cmd\git.exe commit -m "feat: add LocalCardRepository, remove old CardsRepository"
```
