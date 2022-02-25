// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';

abstract class ICriptoCoinRepository {
  Future<List<dynamic>> getCoins();
}

class CriptoCoinRepository implements ICriptoCoinRepository {
  final Client _client;
  final API_URL = 'https://api.coinbase.com/v2/assets/search?base=BRL';

  const CriptoCoinRepository(Client client) : _client = client;

  @override
  Future<List<dynamic>> getCoins() async {
    final response = await _client.get(Uri.parse(API_URL));
    Map<String, dynamic> map = json.decode(response.body);
    return map['data'];
    //return list.map((coin) => Coin.fromMap(coin)).toList();
  }
}
