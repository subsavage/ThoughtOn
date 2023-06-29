import 'package:flutter/material.dart';

import '../models/user-model.dart';

Widget thoughtTile(User user) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Column(
          children: [
            Text(user.id),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text(user.thought)),
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
