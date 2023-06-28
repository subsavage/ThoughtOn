import 'package:flutter/material.dart';
import 'package:whisperapp/services/signup-services.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await signInwithGoogle();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(137, 250, 237, 237),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(
                  5.0,
                  5.0,
                ),
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/google-icon.png",
            scale: 10,
          ),
          const Text("SignUp with Google"),
        ]),
      ),
    );
  }
}
