import 'package:bankapp/app/modules/widgets/custom_buttom.dart';
import 'package:bankapp/app/shared/core/exports.dart';

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
                margin: EdgeInsets.only(top: height * 0.1),
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.7,
                  child: Lottie.asset('assets/lottie/plane.json'),
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
              SizedBox(height: height * 0.04),
              CustomButton(
                text: 'Login',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                fontSize: 18,
                onPressedFunction: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
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
