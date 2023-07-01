import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whisperapp/widgets/thought-tile.dart';
import '../models/user-model.dart';
import '../services/thought-post-services.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int likeCount = 0;
  bool isLiked = false;
  Map likes = {};
  User? currentUser = FirebaseAuth.instance.currentUser;

  handLikePost() async {
    String? currentUserId = currentUser?.uid;
    String? upostId = globalpostId;
    bool likedByCurrentUser = likes[currentUserId] == true;

    if (likedByCurrentUser) {
      FirebaseFirestore.instance
          .collection('thoughts')
          .doc(currentUserId)
          .update({
        'likes.$currentUserId': false,
      });
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUserId] = false;
      });
    } else {
      FirebaseFirestore.instance
          .collection('thoughts')
          .doc(currentUserId)
          .update({'likes.$currentUserId': true});
      setState(() {
        likeCount += 1;
        isLiked = true;
        likes[currentUserId] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<UserModel>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                isLiked =
                    (likes[currentUser?.uid] == true); // Move this line here
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(user.name ?? 'Unkown'),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(4.0, 4.0)),
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0)),
                                ]),
                            child: Center(child: Text(user.thought!)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      handLikePost();
                                    },
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                    ),
                                  ),
                                  Text(likeCount.toString()),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.handshake_outlined),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
