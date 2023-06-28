import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: IconButton(
        onPressed: () async {
          await GoogleSignIn().signOut();
          FirebaseAuth.instance.signOut();
        },
        icon: Icon(Icons.power_settings_new),
      ),
    ));
  }
}
