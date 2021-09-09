class EstablishmentTypeModel {
  List<EstablishmentType> establishmentType;

  EstablishmentTypeModel({this.establishmentType});

  EstablishmentTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['EstablishmentType'] != null) {
      establishmentType = new List<EstablishmentType>();
      json['EstablishmentType'].forEach((v) {
        establishmentType.add(new EstablishmentType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.establishmentType != null) {
      data['EstablishmentType'] =
          this.establishmentType.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EstablishmentType {
  int id;
  String name;
  String createdAt;
  String updatedAt;

  EstablishmentType({this.id, this.name, this.createdAt, this.updatedAt});

  EstablishmentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}