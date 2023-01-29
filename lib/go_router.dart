import 'package:go_router/go_router.dart';

import 'features/confirmation/confirmation_page.dart';
import 'features/home/home_page.dart';
import 'features/interstitial/interstitial_page.dart';
import 'features/messageInfo/message_page.dart';
import 'features/signin/signin_page.dart';
import 'features/signup/signup_page.dart';

final GoRouter mmsRouterConfig = GoRouter(
  routes: [
    GoRoute(
      name: InterstitialPage.name,
      path: InterstitialPage.path,
      builder: (context, state) => const InterstitialPage(),
    ),
    GoRoute(
      name: SignupPage.name,
      path: SignupPage.path,
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      name: SigninPage.name,
      path: SigninPage.path,
      builder: (context, state) => SigninPage(),
    ),
    GoRoute(
      name: ConfirmationPage.name,
      path: ConfirmationPage.path,
      builder: (context, state) => ConfirmationPage(),
    ),
    GoRoute(
      name: MessagePage.name,
      path: MessagePage.path,
      builder: (context, state) => MessagePage(),
    ),
    GoRoute(
      name: HomePage.name,
      path: HomePage.path,
      builder: (context, state) => HomePage(),
    ),
  ],
);
