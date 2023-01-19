import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CancelButton extends StatelessWidget {
  const CancelButton({super.key, this.id});
  final id;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: UniqueKey(),
      onPressed: () {
        increment(id);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
      child: const Text('Cancel'),
    );
  }

  Future increment(String uid) async {
    final DocumentReference docRef =
        FirebaseFirestore.instance.collection("classes").doc(uid);
    docRef.update({"noOfSlots": FieldValue.increment(1)});
  }
}
