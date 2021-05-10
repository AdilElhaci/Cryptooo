import 'dart:convert';

import 'package:cryptoo/core/constants/api_and_asset_exist_data.dart';
import 'package:http/http.dart' as http;

import '../models/crypto.model.dart';

Future<List<CryptoModel>> getCryptoData() async {
  String url = "https://api.coincap.io/v2/assets";
  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);
  List<CryptoModel> cryptoList = [];
  for (var u in jsonData['data']) {
    for (var item in CryptoAssetArray.instance.existArray) {
      if (item == (u['symbol'])) {
        CryptoModel data = CryptoModel(
          id: u['id'],
          name: u['name'],
          rank: u['rank'],
          priceUsd: double.parse(u['priceUsd']),
          symbol: u['symbol'],
        );
        cryptoList.add(data);
        break;
      }
    }
  }

  return cryptoList;
}
