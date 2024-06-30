class ProvinceModel {
  List<Provinces>? provinces;

  ProvinceModel({this.provinces});

  ProvinceModel.fromJson(Map<String, dynamic> json) {
    if (json['provinces'] != null) {
      provinces = <Provinces>[];
      json['provinces'].forEach((v) {
        provinces!.add(new Provinces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provinces != null) {
      data['provinces'] = this.provinces!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Provinces {
  String? id;
  String? name;

  Provinces({this.id, this.name});

  Provinces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
