import 'package:flutter/material.dart';
import 'package:whisperapp/services/user-services.dart';

import '../models/user-model.dart';

Widget thoughtTile(User user) {
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
                    BoxShadow(color: Colors.black, offset: Offset(4.0, 4.0)),
                    BoxShadow(color: Colors.white, offset: Offset(0.0, 0.0)),
                  ]),
              child: Center(child: Text(user.thought)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    initAuth();
                  },
                  icon: const Icon(Icons.favorite_outline),
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
}
