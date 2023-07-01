import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whisperapp/models/user-model.dart';
import 'package:whisperapp/screens/update-name.dart';
import 'package:whisperapp/services/signout-services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            signOut();
            Navigator.pop(context);
            const snackbar = SnackBar(
              content: Text("Logged Out"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          icon: const Icon(Icons.power_settings_new),
        )
      ]),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Image.asset(
                "assets/images/default_profile_pic.png",
                fit: BoxFit.scaleDown,
                scale: 2.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    // height: 50,
                    // width: double.infinity,
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.rectangle,
                    //   border: Border.all(
                    //     color: Colors.black,
                    //   ),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Container())));
                      // final docUser = FirebaseFirestore.instance
                      //     .collection("thoughts")
                      //     .doc("name");
                      // docUser.update({
                      //   'name': "Demo Name",
                      // });
                    },
                    icon: const Icon(Icons.edit),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
