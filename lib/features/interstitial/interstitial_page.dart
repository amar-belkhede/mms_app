import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import '../../util/string_value.dart';
import '../authentication/bloc/auth_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../authentication/authentication_page.dart';
import '../common/app_logo.dart';
import '../common_import.dart';
import '../authentication/signin/signin_page.dart';
import '../authentication/signup/signup_page.dart';

class InterstitialPage extends StatefulWidget {
  const InterstitialPage({super.key});

  static const String name = 'interstitial';
  static const String path = '/';

  @override
  State<InterstitialPage> createState() => _InterstitialPageState();
}

class _InterstitialPageState extends State<InterstitialPage> {


  @override
  void initState() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const AppLogo(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.mmsIndigo)),
                    onPressed: () {
                      AuthBloc.of(context).add(
                          AuthTypeEvent(authType: AuthenticationType.signup));
                      context.push(AuthenticationPage.path);
                    },
                    child: const Text(StringValue.openAnAccount,
                        style: TextStyle(color: Colors.white)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      AuthBloc.of(context).add(
                          AuthTypeEvent(authType: AuthenticationType.signin));
                      context.push(AuthenticationPage.path);
                    },
                    child: const Text(StringValue.signIn),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
