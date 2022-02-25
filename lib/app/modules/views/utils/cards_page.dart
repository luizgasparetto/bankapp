import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_back.dart';
import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_front.dart';
import 'package:bankapp/app/shared/core/exports.dart';
import 'package:flip_card/flip_card.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.03),
          child: Column(
            children: [
              const FlipCard(
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                front: CustomCreditCardFront(),
                back: CustomCreditCardBack(),
              ),
              SizedBox(height: height * 0.03),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
