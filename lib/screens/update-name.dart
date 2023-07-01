// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:whisperapp/models/user-model.dart';

// class UpdateName extends StatefulWidget {
//   const UpdateName({super.key});

//   @override
//   State<UpdateName> createState() => _UpdateNameState();
// }

// class _UpdateNameState extends State<UpdateName> {
//   final _controller = TextEditingController();
//   // late User user;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: TextFormField(
//                 controller: _controller,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   final docUser = FirebaseFirestore.instance
//                       .collection("thoughts")
//                       .doc(user.id);
//                   docUser.update({
//                     'name': _controller.text,
//                   });
//                 },
//                 child: const Text("Update Name"))
//           ],
//         ),
//       ),
//     );
//   }
// }
