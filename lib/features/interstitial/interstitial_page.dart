import 'package:go_router/go_router.dart';
import '../../core/auth/bloc/auth_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../common/app_logo.dart';
import '../common_import.dart';
import '../signin/signin_page.dart';
import '../signup/signup_page.dart';

class InterstitialPage extends StatefulWidget {
  const InterstitialPage({super.key});

  static const String name = 'interstitial';
  static const String path = '/';

  @override
  State<InterstitialPage> createState() => _InterstitialPageState();
}

class _InterstitialPageState extends State<InterstitialPage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc.of(context);
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
                      _authBloc.add(SignUpEvent());
                      context.push(SignupPage.path);
                    },
                    child: const Text('Open an Account',
                        style: TextStyle(color: Colors.white)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _authBloc.add(SignInEvent());
                      context.push(SigninPage.path);
                    },
                    child: const Text('Sign in'),
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
