// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/models/criptocoin.dart';
import 'package:http/http.dart';

abstract class ICriptoCoinRepository {
  Future<List<CriptoCoin>> getCoins();
  String setCurrentQuantity(double quantity);
  void setDefaultQuantity();
}

class CriptoCoinRepository extends ChangeNotifier
    implements ICriptoCoinRepository {
  final Client _client;
  final API_URL = 'https://api.coinbase.com/v2/assets/search?base=BRL';
  double currentQuantity = 0;

  CriptoCoinRepository(Client client) : _client = client;

  @override
  Future<List<CriptoCoin>> getCoins() async {
    final response = await _client.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    final dataList = map['data'] as List;
    return dataList.map((coin) => CriptoCoin.fromMap(coin)).toList();
    //return list.map((coin) => Coin.fromMap(coin)).toList();
  }

  @override
  String setCurrentQuantity(double quantity) {
    currentQuantity = quantity;
    notifyListeners();
    return currentQuantity.toString();
  }

  @override
  void setDefaultQuantity() {
    currentQuantity = 0;
    notifyListeners();
  }
}
