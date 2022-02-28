import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/modules/widgets/custom_buttom.dart';
import 'package:bankapp/app/shared/models/criptocoin.dart';
import 'package:bankapp/app/shared/repositories/criptocoin_repository.dart';
import 'package:bankapp/app/shared/services/formatter.dart';

class CustomCriptoBottomSheet extends StatelessWidget {
  final CriptoCoin coin;

  const CustomCriptoBottomSheet({Key? key, required this.coin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.15,
            child: Image.network(coin.imgUrl),
          ),
          SizedBox(height: height * 0.02),
          Text(
            coin.name.toUpperCase(),
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).textScaleFactor * 25,
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(Formatter.numberFormat(double.parse(coin.latestPrice))),
          SizedBox(height: height * 0.03),
          CustomTextField(
            hintText: 'Quantity',
            icon: const Icon(MaterialCommunityIcons.currency_usd),
            keyboardType: TextInputType.number,
            onChangedFunction: (value) => value.isNotEmpty
                ? GetIt.I<CriptoCoinRepository>()
                    .setCurrentQuantity(double.parse(value))
                : GetIt.I<CriptoCoinRepository>().setCurrentQuantity(0),
          ),
          SizedBox(height: height * 0.03),
          Text(
            (GetIt.I<CriptoCoinRepository>().quantityXPrice(coin.latestPrice)),
            style: GoogleFonts.lato(color: Colors.green),
          ),
          const Spacer(),
          CustomButton(
            text: 'BUY',
            color: Theme.of(context).primaryColor,
            fontSize: MediaQuery.of(context).textScaleFactor * 20,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
