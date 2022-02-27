// ignore_for_file: unused_local_variable

import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_back.dart';
import 'package:bankapp/app/modules/widgets/creditcard/custom_credit_card_front.dart';
import 'package:bankapp/app/shared/blocs/creditcards/creditcards_bloc.dart';
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
            onPressed: () {},
            child: Text(
              'Cadastrar cartão',
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
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
                    final cardList = state.creditCards;
                    return cardList.isEmpty
                        ? const Center(
                            child: Text('Ainda não há cartões cadastrados'),
                          )
                        : ListView.separated(
                            itemCount: cardList.length,
                            itemBuilder: (context, index) {
                              return const FlipCard(
                                fill: Fill.fillBack,
                                direction: FlipDirection.HORIZONTAL,
                                front: CustomCreditCardFront(),
                                back: CustomCreditCardBack(),
                              );
                            },
                            separatorBuilder: (_, __) => const Divider(),
                          );
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

// const FlipCard(
//   fill: Fill.fillBack,
//   direction: FlipDirection.HORIZONTAL,
//   front: CustomCreditCardFront(),
//   back: CustomCreditCardBack(),
// ),
// SizedBox(height: height * 0.03),
// const Divider(),
// FutureBuilder<List>(
//                 future: GetIt.I<FirestoreRepository>().getCreditCards(),
//                 builder: ((context, snapshot) {
//                   if (snapshot.data == null) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.data!.isEmpty) {
//                     return const Center(
//                       child: Text('Ainda não há cartões de crédito'),
//                     );
//                   } else {
//                     return const Center(child: Text('Cartões Cadastrados'));
//                   }
//                 }),
//               )
