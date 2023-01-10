import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yarab/models/Admins/classesModel.dart';
import 'package:yarab/models/Users/usermodel.dart';

void ClassesDb(
    {required String classname,
    required String instructorname,
    required String duration,
    required String noOfSlots}) async {
  final docUser = FirebaseFirestore.instance.collection('classes').doc();
  final classes = Classes(
      id: docUser.id, classname: classname, instructorname: instructorname, duration: duration, noOfSlots: noOfSlots);
  final json = classes.toJson();
  await docUser.set(json);
}

Stream<List<Classes>> readClasses() {
  return FirebaseFirestore.instance.collection('classes').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Classes.fromJson(doc.data())).toList());
}

Future<void> deleteClasses(String id) async {
  await FirebaseFirestore.instance.collection('classes').doc(id).delete();
}
