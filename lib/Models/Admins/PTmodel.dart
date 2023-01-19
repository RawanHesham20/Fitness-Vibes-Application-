// To parse this JSON data, do
//
//     final Classes = ClassesFromJson(jsonString);

import 'dart:convert';

List<PrivateTrainers> classesFromJson(String str) =>
    List<PrivateTrainers>.from(json.decode(str).map((x) => PrivateTrainers.fromJson(x)));

String classesToJson(List<PrivateTrainers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrivateTrainers {
  PrivateTrainers({
    required this.id,
    required this.trainername,
    required this.age,
    required this.phonenumber,
    required this.email,
    required this.availabledays,
    required this.sessionduration,
  
  });
  String id;
  String trainername;
  String age;
  String email;
  String phonenumber;
  String availabledays;
  String sessionduration;


  factory PrivateTrainers.fromJson(Map<String, dynamic> json) => PrivateTrainers(
        id: json["id"],
        trainername: json["trainername"],
        age: json["age"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        availabledays: json["availabledays"],
        sessionduration: json["sessionduration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trainername": trainername,
        "age": age,
        "email": email,
        "phonenumber":phonenumber,
        "availabledays": availabledays,
        "sessionduration": sessionduration,
        
      };
}
