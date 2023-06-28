import 'package:flutter/material.dart';
import 'package:whisperapp/widgets/signup-button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Image.asset(
              "assets/images/signup-vector.jpg",
            ),
            const SignUpButton(),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ]),
        ),
      ),
    );
  }
}
