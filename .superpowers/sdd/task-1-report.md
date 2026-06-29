# Task 1 Report: Create Core Repository Interfaces

## What was implemented
- Created `lib/core/repositories/card_repository.dart` with abstract `CardRepository` class (methods: getAll, getById, filter, imageUrl)
- Created `lib/core/repositories/deck_repository.dart` with abstract `DeckRepository` class (methods: getAll, save, delete)

## Testing and results
- Ran `flutter analyze lib/core/repositories/` — **No issues found**

## Files changed
- `lib/core/repositories/card_repository.dart` (added)
- `lib/core/repositories/deck_repository.dart` (added)

## Self-review findings
- None — both files are simple abstract classes consuming existing models with no circular dependencies

## Issues or concerns
- None
