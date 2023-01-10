// To parse this JSON data, do
//
//     final Classes = ClassesFromJson(jsonString);

import 'dart:convert';

List<Classes> classesFromJson(String str) =>
    List<Classes>.from(json.decode(str).map((x) => Classes.fromJson(x)));

String classesToJson(List<Classes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Classes {
  Classes({
    required this.id,
    required this.classname,
    required this.instructorname,
    required this.duration,
    required this.noOfSlots,

  });
  String id;
  String classname;
  String instructorname;
  String duration;
  String noOfSlots;


  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
        id: json["id"],
        classname: json["classname"],
        instructorname: json["instructorname"],
        duration: json["duration"],
        noOfSlots: json["noOfSlots"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "classname": classname,
        "instructorname": instructorname,
        "duration": duration,
        "noOfSlots": noOfSlots,
      };
}
