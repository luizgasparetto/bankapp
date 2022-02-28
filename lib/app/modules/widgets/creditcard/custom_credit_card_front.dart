import 'package:bankapp/app/core/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCreditCardFront extends StatelessWidget {
  final String cardName;
  final String cardNumber;
  final String expirationDate;

  const CustomCreditCardFront({
    Key? key,
    required this.cardName,
    required this.cardNumber,
    required this.expirationDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: height * 0.25,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                cardNumber,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).textScaleFactor * 20,
                  fontFamily: 'OCR',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: width * 0.02, bottom: height * 0.01),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: width * 0.2,
                height: height * 0.08,
                child: SvgPicture.asset('assets/svg/mastercard.svg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.09, bottom: height * 0.035),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                cardName.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: 'OCR',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.6, bottom: height * 0.035),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                expirationDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: 'OCR',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
