// ignore_for_file: unused_local_variable

import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_back.dart';
import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_front.dart';
import 'package:bankapp/app/shared/blocs/creditcards/creditcards_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_card/flip_card.dart';

import 'dart:developer' as dev;

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
                              //left: MediaQuery.of(context).size.width * ,
                              //right: MediaQuery.of(context).size.width * 0.1,
                            ),
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Lottie.asset(
                              'assets/lottie/astronaut.json',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       margin: EdgeInsets.only(
                          //         top:
                          //             MediaQuery.of(context).size.height * 0.52,
                          //         //right: MediaQuery.of(context).size.width * 0.1,
                          //       ),
                          //       child: Text(
                          //         "Don't have a card yet? Register one right now!",
                          //         textAlign: TextAlign.center,
                          //         style: GoogleFonts.lato(
                          //           color: Colors.grey.shade600,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      );
                    } else {
                      final cardList = state.creditCards;
                      return RefreshIndicator(
                        child: ListView.separated(
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
                              onLongPress: () => dev.log('LONGPRESS'),
                            );
                          },
                          separatorBuilder: (_, __) => const Divider(),
                        ),
                        onRefresh: () async {
                          return Future.delayed(const Duration(seconds: 1))
                              .then(
                            (_) => dev.log('refresh'),
                          );
                        },
                      );
                      //return const Center(child: Text('TEM CARTÃO'));
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
