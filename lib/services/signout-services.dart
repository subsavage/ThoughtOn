import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

signOut() async {
  await GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
}
