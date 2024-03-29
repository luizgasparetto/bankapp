import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/blocs/creditcards/creditcards_bloc.dart';
import 'package:bankapp/app/shared/repositories/credit_card_repository.dart';
import 'package:bankapp/app/shared/services/formatter.dart';

import 'package:bankapp/app/shared/services/implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final implementation = GetIt.I<Implementation>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.08),
          Padding(
            padding: EdgeInsets.only(left: height * 0.02),
            child: IconButton(
              icon: Icon(
                AntDesign.user,
                color: Colors.black,
                size: height * 0.045,
              ),
              onPressed: () => Navigator.pushNamed(context, '/user'),
            ),
          ),
          SizedBox(height: height * 0.03), // height * 0.03
          Container(
            margin: EdgeInsets.only(left: height * 0.035, right: height * 0.03),
            child: FutureBuilder<String?>(
              future: implementation.getName(),
              builder: (context, snapshot) {
                return Text(
                  '${implementation.timeValidator()},\n${snapshot.data ?? ''}',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor * 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.1),
          Container(
            margin: EdgeInsets.only(left: height * 0.03, right: height * 0.03),
            child: CustomListTile(
              title: 'Saldo em Conta',
              subtitle: FutureBuilder(
                future: implementation.getData('balance'),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      Formatter.numberFormat(double.parse(
                        snapshot.data.toString(),
                      )),
                      style: TextStyle(
                          fontSize: height * 0.028, color: Colors.black),
                    );
                  }
                  return const Text('');
                }),
              ),
              key: const Key('saldoTile'),
              onPressedFunction: () {
                GetIt.I<CreditCardRepository>().updateFields(
                  value: '',
                  cardName: true,
                );
              },
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            margin: EdgeInsets.only(left: height * 0.03, right: height * 0.03),
            child: CustomListTile(
              title: 'Para pagar',
              subtitle: FutureBuilder(
                future: implementation.getData('toPay'),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      Formatter.numberFormat(double.parse(
                        snapshot.data.toString(),
                      )),
                      style: TextStyle(
                          fontSize: height * 0.028, color: Colors.black),
                    );
                  }
                  return const Text('');
                }),
              ),
              key: const Key('toPayTile'),
            ),
          ),
          SizedBox(height: height * 0.11),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ActionCard(
                    icon: Icons.payment,
                    text: 'Meus\nCartões',
                    onTap: () {
                      Navigator.pushNamed(context, '/cards');
                      BlocProvider.of<CreditCardsBloc>(context).add(
                        CreditCardsFetchEvent(),
                      );
                    },
                  ),
                  ActionCard(
                    icon: MaterialCommunityIcons.ethereum,
                    text: 'Cripto\nStore',
                    onTap: () => Navigator.pushNamed(context, '/cripto'),
                  ),
                  // ActionCard(
                  //   icon: Icons.receipt,
                  //   text: 'Consultar\nExtrato',
                  //   onTap: () => Navigator.pushNamed(context, '/statement'),
                  // ),
                  // ActionCard(
                  //   icon: MaterialCommunityIcons.currency_usd,
                  //   text: 'Depositar\ndinheiro aqui',
                  //   onTap: () => Navigator.pushNamed(context, '/deposit'),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
