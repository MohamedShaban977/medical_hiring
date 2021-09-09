class BusinessModel {
  List<Business> business;

  BusinessModel({this.business});

  BusinessModel.fromJson(Map<String, dynamic> json) {
    if (json['business'] != null) {
      business = <Business>[];
      json['business'].forEach((v) {
        business.add(new Business.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.business != null) {
      data['business'] = this.business.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Business {
  int id;
  String name;
  var parentId;
  String createdAt;
  String updatedAt;

  Business({this.id, this.name, this.parentId, this.createdAt, this.updatedAt});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}