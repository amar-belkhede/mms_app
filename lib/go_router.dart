import 'package:go_router/go_router.dart';
import 'features/authentication/authentication_page.dart';
import 'features/home/home_page.dart';
import 'features/interstitial/interstitial_page.dart';

final GoRouter mmsRouterConfig = GoRouter(
  routes: [
    GoRoute(
      name: InterstitialPage.name,
      path: InterstitialPage.path,
      builder: (context, state) => const InterstitialPage(),
    ),
    GoRoute(
      name: AuthenticationPage.name,
      path: AuthenticationPage.path,
      builder: (context, state) => AuthenticationPage(),
    ),
    GoRoute(
      name: HomePage.name,
      path: HomePage.path,
      builder: (context, state) => HomePage(),
    ),
  ],
);
