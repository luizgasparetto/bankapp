import 'package:bankapp/app/core/exports.dart';

class CustomCreditCardBack extends StatelessWidget {
  final String cvvCode;

  const CustomCreditCardBack({Key? key, required this.cvvCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
            width: double.infinity,
            margin: EdgeInsets.only(top: height * 0.03),
            height: height * 0.06,
            color: Colors.grey.shade400,
            child: Container(
              margin: EdgeInsets.only(right: width * 0.05, top: height * 0.01),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  cvvCode,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).textScaleFactor * 16,
                    fontFamily: 'OCR',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            child: Container(
              margin: EdgeInsets.only(top: height * 0.11),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaleFactor * 11,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
