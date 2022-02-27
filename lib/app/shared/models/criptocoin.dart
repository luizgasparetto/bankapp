import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/repositories/criptocoin_repository.dart';

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

  CriptoCoin copyWith({
    String? name,
    String? symbol,
    String? imgUrl,
    String? latestPrice,
  }) {
    return CriptoCoin(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      imgUrl: imgUrl ?? this.imgUrl,
      latestPrice: latestPrice ?? this.latestPrice,
    );
  }

  @override
  List<Object?> get props => [name, symbol, imgUrl, latestPrice];
}
