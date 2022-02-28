import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/utils/custom_input_formatter.dart';
import 'package:bankapp/app/modules/widgets/custom_buttom.dart';
import 'package:bankapp/app/shared/repositories/credit_card_repository.dart';
import 'package:bankapp/app/shared/services/implementation.dart';
import 'package:flutter/services.dart';

class RegisterCardPage extends StatelessWidget {
  const RegisterCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final creditCardRepository = GetIt.I<CreditCardRepository>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar Cartão',
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Lottie.asset('assets/lottie/card.json'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Card Name'),
                ),
              ),
              CustomTextField(
                hintText: 'Luiz E. Gasparetto',
                icon: const Icon(AntDesign.user),
                maxLength: 30,
                onChangedFunction: creditCardRepository.updateCardName,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 4),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Card Number')),
              ),
              CustomTextField(
                hintText: '1111 2222 3333 4444',
                icon: const Icon(Icons.payment),
                maxLength: 19,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CustomInputFormatter(quantity: 4, separator: ' '),
                ],
                keyboardType: TextInputType.number,
                onChangedFunction: creditCardRepository.updateCardNumber,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Expiration Date'),
                ),
              ),
              CustomTextField(
                hintText: '10/10',
                icon: const Icon(Icons.calendar_month),
                maxLength: 5,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CustomInputFormatter(quantity: 2, separator: '/'),
                ],
                keyboardType: TextInputType.number,
                onChangedFunction: creditCardRepository.updateExpirationDate,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('CVV Number'),
                ),
              ),
              CustomTextField(
                hintText: '000',
                icon: const Icon(Icons.password),
                maxLength: 3,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                onChangedFunction: creditCardRepository.updateCvvNumber,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              CustomButton(
                text: 'Cadastrar',
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                textColor: Colors.white,
                onPressedFunction: () async {
                  await GetIt.I<Implementation>().registerCreditCard(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
