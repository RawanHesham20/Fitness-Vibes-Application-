// To parse this JSON data, do
//
//     final Users = UsersFromJson(jsonString);

import 'dart:convert';

List<bookSpa> BookspaFromJson(String str) =>
    List<bookSpa>.from(json.decode(str).map((x) => bookSpa.fromJson(x)));

String BookspaToJson(List<bookSpa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class bookSpa {
  bookSpa({
    this.id,
    required this.Name,
    required this.Mobile,
    required this.Email,
    required this.PackageName,
    required this.DT,
  });
  String? id;
  String Name;
  String Mobile;
  String Email;
  List PackageName;
  DateTime DT;

  factory bookSpa.fromJson(Map<String, dynamic> json) => bookSpa(
        id: json["id"],
        Name: json["name"],
        Mobile: json["mobile"],
        Email: json["email"],
        PackageName: json["PackageName"],
         DT: json["DT"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": Name,
        "mobile": Mobile,
        "email": Email,
        "packageName": PackageName,
        "DT": DT,
      };
}
