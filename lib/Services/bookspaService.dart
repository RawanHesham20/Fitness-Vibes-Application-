import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yarab/models/Admins/classesModel.dart';
import '../models/Users/spamodel.dart';

void SpaDb({
  required String PackageName,
  required String Name,
  required String Mobile,
  required String Email,
  required DateTime DT,
}) async {
  final docUser = FirebaseFirestore.instance.collection('BookedSpa').doc();
  final spa = bookSpa(
    id: docUser.id,
    PackageName: [],
    Name: Name,
    Mobile: Mobile,
    Email: Email,
    DT: DT,
  );
  //DateTime:DateTime );
  final json = spa.toJson();
  await docUser.set(json);
}

Stream<List<bookSpa>> WriteSpa() {
  return FirebaseFirestore.instance.collection('BookedSpa').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => bookSpa.fromJson(doc.data())).toList());
}

Future<void> deleteClasses(String id) async {
  await FirebaseFirestore.instance.collection('BookedSpa').doc(id).delete();
}
