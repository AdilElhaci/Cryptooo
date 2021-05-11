class WeeklyCryptoModel {
  int id;
  String symbol;
  double price;
  String date;

  WeeklyCryptoModel({this.id, this.symbol, this.price, this.date});

  WeeklyCryptoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['symbol'] = this.symbol;
    data['price'] = this.price;
    data['date'] = this.date;
    return data;
  }
}
