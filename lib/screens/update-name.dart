import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user-model.dart';

class UpdateName extends StatefulWidget {
  const UpdateName({Key? key}) : super(key: key);

  @override
  State<UpdateName> createState() => _UpdateNameState();
}

class _UpdateNameState extends State<UpdateName> {
  final _controller = TextEditingController();

  Future<UserModel> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final doc = await FirebaseFirestore.instance
        .collection("thoughts")
        .doc(user!.uid)
        .get();

    if (doc.exists && doc.data() != null) {
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      return UserModel();
    }
  }

  Future<void> updateThought(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection("thoughts")
          .doc(userId)
          .update({
        'name': _controller.text,
      });
      print("Field updated successfully!");
    } catch (e) {
      print("Error updating field: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextFormField(
                controller: _controller,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final updateuser = await getUserData();
                await updateThought(updateuser.id!);
                print(updateuser.id);
              },
              child: const Text("Update Name"),
            ),
          ],
        ),
      ),
    );
  }
}
