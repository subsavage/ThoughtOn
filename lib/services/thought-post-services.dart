import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whisperapp/services/user-services.dart';

import '../models/user-model.dart';

final globalpostId = FirebaseFirestore.instance.collection('thoughts').doc().id;

Future createThought({required String thought}) async {
  final userThought = FirebaseFirestore.instance.collection('thoughts').doc();

  final userName = await initAuth();

  final user = UserModel(
    id: userThought.id,
    name: userName,
    thought: thought,
    likes: {},
    postId: globalpostId,
  );
  final json = user.toJson();

  await userThought.set(json);
}

Stream<List<UserModel>> readUsers() {
  return FirebaseFirestore.instance
      .collection("thoughts")
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
  });
}
