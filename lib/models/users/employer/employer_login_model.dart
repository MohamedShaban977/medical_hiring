import 'dart:io';

class EmployerLoginModel {
  bool status;
  String message;
  UserData data;
  String token;

  EmployerLoginModel({this.status, this.message, this.data, this.token});

  EmployerLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['employer'] != null
            ? UserData.fromJson(json['employer'])
            : null;
    token = json['token'] ?? null;
  }
}

class UserData {
  String email;
  String companyName;
  String country;
  String city;
  String business;
  String establishment_type_id;
  int established_at;
  String website;
  String image;

  UserData(
      {this.email,
      this.companyName,
      this.country,
      this.city,
      this.business,
      this.establishment_type_id,
      this.established_at,
      this.website,
      this.image});
// "email": "asem@gmail.com",
// "company_name": "Vodafone",
// "country": "Egypt",
// "city": "cairo",
// "business": "nursing",
// "establishment_type_id": "nursing",
// "established_at": 2020,
// "website": "https:/localhost:8000",
// "image": null
  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    companyName = json['company_name'];
    country = json['country'];
    city = json['city'];
    business = json['business'];
    establishment_type_id = json['establishment_type_id'];
    established_at = json['established_at'];
    website = json['website'];
    image = json['image'];
  }
}

// class EmployerLoginModel {
//   bool status;
//   String message;
//   Employer employer;
//   String token;
//
//   EmployerLoginModel({this.status, this.message, this.employer, this.token});
//
//   EmployerLoginModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     employer = json['employer'] != null
//         ? new Employer.fromJson(json['employer'])
//         : null;
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.employer != null) {
//       data['employer'] = this.employer.toJson();
//     }
//     data['token'] = this.token;
//     return data;
//   }
// }
//
// class Employer {
//   String email;
//   String companyName;
//   String country;
//   String city;
//   String business;
//   String establishmentTypeId;
//   int establishedAt;
//   String website;
//   Null image;
//
//   Employer(
//       {this.email,
//         this.companyName,
//         this.country,
//         this.city,
//         this.business,
//         this.establishmentTypeId,
//         this.establishedAt,
//         this.website,
//         this.image});
//
//   Employer.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     companyName = json['company_name'];
//     country = json['country'];
//     city = json['city'];
//     business = json['business'];
//     establishmentTypeId = json['establishment_type_id'];
//     establishedAt = json['established_at'];
//     website = json['website'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['company_name'] = this.companyName;
//     data['country'] = this.country;
//     data['city'] = this.city;
//     data['business'] = this.business;
//     data['establishment_type_id'] = this.establishmentTypeId;
//     data['established_at'] = this.establishedAt;
//     data['website'] = this.website;
//     data['image'] = this.image;
//     return data;
//   }
// }
