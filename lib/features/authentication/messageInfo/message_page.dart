import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';
import '../../common/mms_text_button.dart';
import '../../common_import.dart';
import '../../home/home_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                textAlign: TextAlign.center,
                'Account Created',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Congratulations. Your account has been created',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Please click on the "Continue" button to \n get into the app and start taking charge of your finances',
              ),
              const SizedBox(
                height: 50,
              ),
              MmsButton(
                buttonText: 'Continue',
                textColor: Colors.white,
                backgroundColor: AppColors.mmsIndigo,
                onPressed: () {
                  AuthBloc.of(context).add(AuthSuccessEvent());
                  context.push(HomePage.path);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
