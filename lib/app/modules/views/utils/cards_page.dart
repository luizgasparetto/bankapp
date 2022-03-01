// ignore_for_file: unused_local_variable

import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_back.dart';
import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_front.dart';
import 'package:bankapp/app/shared/blocs/creditcards/creditcards_bloc.dart';
import 'package:bankapp/app/shared/services/implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_card/flip_card.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        actions: [
          TextButton(
            child: Text(
              'Cadastrar cartão',
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            onPressed: () => Navigator.pushNamed(context, '/registerCard'),
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.03),
          child: Column(
            children: [
              BlocBuilder<CreditCardsBloc, CreditCardsState>(
                builder: ((context, state) {
                  if (state is CreditCardsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CreditCardsLoadedState) {
                    if (state.creditCards.isEmpty) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.25,
                            ),
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Lottie.asset(
                              'assets/lottie/astronaut.json',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      );
                    } else {
                      final cardList = state.creditCards;
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: cardList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: FlipCard(
                              fill: Fill.fillBack,
                              direction: FlipDirection.HORIZONTAL,
                              front: CustomCreditCardFront(
                                cardName: cardList[index]['cardName'],
                                cardNumber: cardList[index]['cardNumber'],
                                expirationDate: cardList[index]
                                    ['expirationDate'],
                              ),
                              back: CustomCreditCardBack(
                                cvvCode: cardList[index]['cvvCode'],
                              ),
                            ),
                            onLongPress: () => showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ListTile(
                                  leading: const Icon(
                                    MaterialCommunityIcons.trash_can_outline,
                                    color: Colors.red,
                                  ),
                                  title: Text(
                                    'Delete this credit card',
                                    style: GoogleFonts.lato(color: Colors.red),
                                  ),
                                  onTap: () async {
                                    await GetIt.I<Implementation>()
                                        .deleteCreditCard(
                                      context,
                                      cardList[index],
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                      );
                    }
                  } else {
                    return const Center(child: Text('ERROR'));
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
