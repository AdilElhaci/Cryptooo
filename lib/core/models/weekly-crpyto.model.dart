class WeeklyCryptoModel {
  int id;
  String symbol;
  int mon;
  int tues;
  int wed;
  int thur;
  int frid;
  int sat;
  int sun;

  WeeklyCryptoModel(
      {this.id,
      this.symbol,
      this.mon,
      this.tues,
      this.wed,
      this.thur,
      this.frid,
      this.sat,
      this.sun});

  WeeklyCryptoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    mon = json['mon'];
    tues = json['tues'];
    wed = json['wed'];
    thur = json['thur'];
    frid = json['frid'];
    sat = json['sat'];
    sun = json['sun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['mon'] = this.mon;
    data['tues'] = this.tues;
    data['wed'] = this.wed;
    data['thur'] = this.thur;
    data['frid'] = this.frid;
    data['sat'] = this.sat;
    data['sun'] = this.sun;
    return data;
  }
}
