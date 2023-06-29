import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisperapp/services/thought-post-services.dart';
import 'package:whisperapp/widgets/create-thought-tile.dart';
import '../services/providers.dart';

class CreateThought extends StatelessWidget {
  const CreateThought({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<Providers>(context);
    final controller = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: controller,
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: "Write your thoughts here",
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final thought = controller.text;
                createThought(thought: thought);
              },
              child: const Text("Post"),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text("Save Draft"),
            // ),
          ],
        ),
      ),
    );
  }
}
