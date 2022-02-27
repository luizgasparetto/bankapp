import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/custom_buttom.dart';
import 'package:bankapp/app/shared/repositories/auth_repository.dart';

import 'dart:developer' as dev;

import 'package:bankapp/app/shared/repositories/user_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.03),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.04),
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.7,
                  child: Lottie.asset('assets/lottie/login.json'),
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Hello Again!',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(horizontal: height * 0.05),
                alignment: Alignment.center,
                child: Text(
                  "Welcome back, you've been missed!",
                  style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).textScaleFactor * 16,
                    color: Theme.of(context).dialogBackgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.04),
              CustomTextField(
                hintText: 'Email',
                icon: const Icon(Icons.email),
                onChangedFunction: GetIt.I<AuthRepository>().updateEmail,
              ),
              SizedBox(height: height * 0.015),
              CustomTextField(
                hintText: 'Password',
                obscureText: true,
                icon: const Icon(Icons.password),
                onChangedFunction: GetIt.I<AuthRepository>().updatePassword,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text('Forgot your password?'),
                  onPressed: () {
                    final currentUser = GetIt.I<AuthRepository>().authUser;
                    dev.log(currentUser.toString());
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomButton(
                text: 'Login',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                fontSize: 18,
                onPressedFunction: () async =>
                    await GetIt.I<UserRepository>().signIn(context),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: MediaQuery.of(context).textScaleFactor * 15,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Sign Up!",
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).textScaleFactor * 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/register'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
