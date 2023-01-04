import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yarab/models/Users/usermodel.dart';

void createUser(
    {required String name,
    required String mobile,
    required String email,
    required String pass}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  final user = User(
      id: docUser.id, name: name, mobile: mobile, email: email, pass: pass);
  final json = user.toJson();
  await docUser.set(json);
}
