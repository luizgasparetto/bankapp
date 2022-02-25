import 'package:bankapp/app/core/exports.dart';

class CriptoCoin extends Equatable {
  final String name;
  final String symbol;
  final String imgUrl;
  final String latestPrice;

  const CriptoCoin({
    required this.name,
    required this.symbol,
    required this.imgUrl,
    required this.latestPrice,
  });

  factory CriptoCoin.fromMap(Map<String, dynamic> map) {
    return CriptoCoin(
      name: map['name'],
      symbol: map['symbol'],
      imgUrl: map['image_url'],
      latestPrice: map['latest_price']['amount']['amount'],
    );
  }

  @override
  List<Object?> get props => [name, symbol, imgUrl, latestPrice];
}
