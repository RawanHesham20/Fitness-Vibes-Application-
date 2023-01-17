import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yarab/models/Users/profileModel.dart';
import 'package:yarab/Screens/Users/fetchAllProfiles.dart';

void ProfileDb(
    {required String name,
    required String email,
    required String mobile}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();

  final profile =
      Profile(id: docUser.id, name: name, email: email, mobile: mobile);
  final json = profile.toJson();

  await docUser.set(json);
}

Stream<List<Profile>> readProfile() {
  final userId = FirebaseAuth.instance.currentUser;
  return FirebaseFirestore.instance
      .collection('users')
      .where("id", isEqualTo: userId!.uid)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Profile.fromJson(doc.data())).toList());
}
