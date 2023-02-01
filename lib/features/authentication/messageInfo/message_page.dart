import 'package:go_router/go_router.dart';

import '../../../util/string_value.dart';
import '../../common/mms_text_button.dart';
import '../../common_import.dart';
import '../../home/home_page.dart';
import '../bloc/auth_bloc.dart';

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
                StringValue.accountCreated,
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
                StringValue.congratulationsMessageAccountCreated,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                StringValue.accountCreationGreeting,
              ),
              const SizedBox(
                height: 50,
              ),
              MmsButton(
                buttonText: StringValue.continuestring,
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
