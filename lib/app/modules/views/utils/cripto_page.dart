import 'package:bankapp/app/shared/blocs/criptocoin/criptocoin_bloc.dart';
import 'package:bankapp/app/shared/core/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CriptoPage extends StatelessWidget {
  const CriptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<CriptoCoinBloc, CriptoCoinState>(
        builder: ((context, state) {
          if (state is CriptoCoinLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CriptoCoinLoadedState) {
            final coinList = state.coinList;

            return ListView.separated(
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(coinList[index]['image_url']),
                  title: Text(coinList[index]['name']),
                  subtitle: Text(coinList[index]['symbol']),
                  trailing: Text(
                    double.parse(
                            coinList[index]['latest_price']['amount']['amount'])
                        .toStringAsFixed(2),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          } else {
            return const Center(child: Text("Something wrong happened"));
          }
        }),
      ),
    );
  }
}
