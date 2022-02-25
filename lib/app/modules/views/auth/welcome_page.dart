import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/custom_buttom.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.2),
              alignment: Alignment.center,
              child: SizedBox(
                width: width * 0.7,
                child: Lottie.asset('assets/lottie/initial.json'),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              'Hey! Welcome',
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
                "We're the BankApp, the easiest way\nto manage your bank account",
                style: GoogleFonts.lato(
                  fontSize: MediaQuery.of(context).textScaleFactor * 16,
                  color: Theme.of(context).dialogBackgroundColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.03),
            Container(
              padding: EdgeInsets.symmetric(horizontal: height * 0.09),
              child: Column(
                children: [
                  CustomButton(
                    key: const Key('getStartedButton'),
                    text: 'Get Started',
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    fontSize: 16,
                    onPressedFunction: () =>
                        Navigator.pushReplacementNamed(context, '/register'),
                  ),
                  SizedBox(height: height * 0.012),
                  CustomButton(
                    key: const Key('accountButton'),
                    text: 'I already have an account',
                    color: Colors.white,
                    fontSize: 16,
                    onPressedFunction: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
