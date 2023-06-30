import 'package:firebase_auth/firebase_auth.dart';

initAuth() {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? userName = currentUser?.displayName;
  return userName;
}
