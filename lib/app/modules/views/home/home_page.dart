import 'package:bankapp/app/shared/core/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false),
            ),
          ),
          SizedBox(height: height * 0.03), // height * 0.03
          Container(
            margin: EdgeInsets.only(left: height * 0.035, right: height * 0.03),
            child: Text(
              'Bom dia,\nAline',
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: height * 0.1),
          Container(
            margin: EdgeInsets.only(left: height * 0.03, right: height * 0.03),
            child: const CustomListTile(
              title: 'Saldo em Conta',
              subtitle: 'R\$ 2.248,55',
              key: Key('saldoTile'),
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            margin: EdgeInsets.only(left: height * 0.03, right: height * 0.03),
            child: const CustomListTile(
              title: 'Para pagar',
              subtitle: 'R\$ 869,50',
              key: Key('toPayTile'),
            ),
          ),
          SizedBox(height: height * 0.13),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ActionCard(
                    icon: Icons.pix,
                    text: 'Pix\n',
                    onTap: () => Navigator.pushNamed(context, '/pix'),
                    key: const Key('pixCard'),
                  ),
                  ActionCard(
                    icon: Icons.receipt,
                    text: 'Consultar\nExtrato',
                    onTap: () => Navigator.pushNamed(context, '/extract'),
                  ),
                  ActionCard(
                    icon: Icons.payment,
                    text: 'Meus\nCartões',
                    onTap: () => Navigator.pushNamed(context, '/cards'),
                  ),
                  ActionCard(
                    icon: MaterialCommunityIcons.currency_usd,
                    text: 'Depositar\ndinheiro aqui',
                    onTap: () => Navigator.pushNamed(context, '/deposit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
