import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/custom_buttom.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';
import 'package:bankapp/app/shared/services/implementation.dart';

class CustomPasswordBottomSheet extends StatelessWidget {
  const CustomPasswordBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text(
            'Reset your password',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColorDark,
              fontSize: MediaQuery.of(context).textScaleFactor * 28,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          CustomTextField(
            hintText: 'Your email',
            icon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            onChangedFunction: GetIt.I<AuthRepository>().updateEmail,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'We will send you an email so you can successfully\nreset your password',
            style: GoogleFonts.lato(
              color: Theme.of(context).dialogBackgroundColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: Lottie.asset('assets/lottie/plane.json'),
          ),
          const Spacer(),
          CustomButton(
            text: 'Send the email',
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            textColor: Colors.white,
            onPressedFunction: () async {
              await GetIt.I<Implementation>().resetPassword(context);
            },
          ),
        ],
      ),
    );
  }
}
