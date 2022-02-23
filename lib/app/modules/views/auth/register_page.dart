import 'package:bankapp/app/shared/core/exports.dart';

import 'package:bankapp/app/modules/widgets/custom_buttom.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                margin: EdgeInsets.only(top: height * 0.1),
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.7,
                  child: Lottie.asset('assets/lottie/register.json'),
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Create an account',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w900,
                  fontSize: MediaQuery.of(context).textScaleFactor * 30,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(horizontal: height * 0.05),
                alignment: Alignment.center,
                child: Text(
                  "Welcome to the good side of the force!",
                  style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).textScaleFactor * 16,
                    color: Theme.of(context).dialogBackgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.04),
              const CustomTextField(
                hintText: 'Full Name',
                icon: Icon(AntDesign.user),
              ),
              SizedBox(height: height * 0.015),
              const CustomTextField(
                hintText: 'Email',
                icon: Icon(Icons.email),
              ),
              SizedBox(height: height * 0.015),
              const CustomTextField(
                hintText: 'Password',
                obscureText: true,
                icon: Icon(Icons.password),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Creatin an account means you agree to all terms and conditions of our services",
                style: GoogleFonts.roboto(
                  color: Theme.of(context).dialogBackgroundColor,
                  fontSize: MediaQuery.of(context).textScaleFactor * 13,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              CustomButton(
                text: 'Register',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                fontSize: MediaQuery.of(context).textScaleFactor * 18,
                onPressedFunction: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: MediaQuery.of(context).textScaleFactor * 15,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Sign In!",
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).textScaleFactor * 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
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