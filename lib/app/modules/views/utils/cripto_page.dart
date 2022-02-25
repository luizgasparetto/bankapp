import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/shimmer/skeleton_list_view.dart';
import 'package:bankapp/app/shared/blocs/criptocoin/criptocoin_bloc.dart';

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
            return const SkeletonListView();
          } else if (state is CriptoCoinLoadedState) {
            final coinList = state.coinList;

            return ListView.separated(
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Image.network(coinList[index].imgUrl),
                      title: Text(coinList[index].name),
                      subtitle: Text(coinList[index].symbol),
                      trailing: Text(
                        "R\$ ${double.parse(coinList[index].latestPrice).toStringAsFixed(2)}",
                      ),
                    ),
                  ],
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
