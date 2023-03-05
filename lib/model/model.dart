class Garagedata {
  List<Data>? data;

  Garagedata({this.data});

  Garagedata.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? color;
  int? number;
  String? address;
  String? mapurl;

  Data({this.name, this.color, this.number, this.address, this.mapurl});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    color = json['color'];
    number = json['number'];
    address = json['address'];
    mapurl = json['mapurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['color'] = this.color;
    data['number'] = this.number;
    data['address'] = this.address;
    data['mapurl'] = this.mapurl;
    return data;
  }
}
