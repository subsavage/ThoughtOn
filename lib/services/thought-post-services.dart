import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whisperapp/services/user-services.dart';

import '../models/user-model.dart';

Future createThought({required String thought}) async {
  final userThought = FirebaseFirestore.instance.collection('thoughts').doc();
  final userName = await initAuth();

  final user = User(
    id: userThought.id,
    name: userName,
    thought: thought,
  );
  final json = user.toJson();

  await userThought.set(json);
}

Stream<List<User>> readUsers() {
  return FirebaseFirestore.instance
      .collection("thoughts")
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) => User.fromJson(doc.data())).toList();
  });
}
