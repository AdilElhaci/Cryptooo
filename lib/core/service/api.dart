import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/crypto.model.dart';

Future<List<CryptoModel>> getCryptoData() async {
  String url = "https://api.coincap.io/v2/assets";
  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);

  List<CryptoModel> cryptoList = [];
  for (var u in jsonData['data']) {
    CryptoModel data = CryptoModel(
      id: u['id'],
      name: u['name'],
      rank: u['rank'],
      priceUsd: double.parse(u['priceUsd']),
      symbol: u['symbol'],
    );
    cryptoList.add(data);
  }

  return cryptoList;
}
