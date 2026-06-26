import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/catalog/presentation/catalog_screen.dart';
import 'features/catalog/presentation/card_detail_screen.dart';
import 'features/catalog/presentation/catalog_provider.dart';
import 'features/compare/presentation/compare_screen.dart';
import 'features/decks/presentation/my_decks_screen.dart';
import 'features/decks/presentation/deck_builder_screen.dart';
import 'features/profile/presentation/profile_screen.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _shellNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: _BottomNav(currentLocation: state.uri.path),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CatalogScreen(),
            ),
          ),
          GoRoute(
            path: '/decks',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MyDecksScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/card/:id',
        builder: (context, state) {
          final cardId = state.pathParameters['id']!;
          final cardsAsync = ref.read(cardsProvider);
          final card = cardsAsync.valueOrNull
              ?.firstWhere((c) => c.id == cardId);
          if (card == null) {
            return const Scaffold(
              body: Center(child: Text('Card not found')),
            );
          }
          return CardDetailScreen(card: card);
        },
      ),
      GoRoute(
        path: '/compare',
        builder: (context, state) => const CompareScreen(),
      ),
      GoRoute(
        path: '/deck/new',
        builder: (context, state) => const DeckBuilderScreen(),
      ),
      GoRoute(
        path: '/deck/:id',
        builder: (context, state) {
          final deckId = state.pathParameters['id']!;
          return DeckBuilderScreen(deckId: deckId);
        },
      ),
    ],
  );
});

class _BottomNav extends StatelessWidget {
  final String currentLocation;
  const _BottomNav({required this.currentLocation});

  @override
  Widget build(BuildContext context) {
    int currentIndex;
    if (currentLocation.startsWith('/decks')) {
      currentIndex = 1;
    } else if (currentLocation.startsWith('/profile')) {
      currentIndex = 2;
    } else {
      currentIndex = 0;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.06)),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
            case 1:
              context.go('/decks');
            case 2:
              context.go('/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_mosaic),
            label: 'Decks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
