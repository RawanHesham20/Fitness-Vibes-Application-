import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Admins/PTmodel.dart';

void PTDb(
    {required String trainername,
    required String availabledays,
    required String sessionduration,
  }) async {
  final docUser = FirebaseFirestore.instance.collection('PT').doc();
  final pt = PrivateTrainers(
      id: docUser.id, trainername: trainername, availabledays: availabledays, sessionduration: sessionduration);
  final json = pt.toJson();
  await docUser.set(json);
}

Stream<List<PrivateTrainers>> readPT() {
  return FirebaseFirestore.instance.collection('PT').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => PrivateTrainers.fromJson(doc.data())).toList());
}

Future<void> deletePT(String id) async {
  await FirebaseFirestore.instance.collection('PT').doc(id).delete();
}