import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/botones',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/tarjetas',
    builder: (context, state) => const CardsScreen(),
  )
]);