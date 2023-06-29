import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisperapp/screens/create-thought.dart';
import 'package:whisperapp/screens/home.dart';
import 'package:whisperapp/screens/thought-details.dart';
import 'package:whisperapp/services/providers.dart';
import '../services/signout-services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const Home(),
    const CreateThought(),
    const ThoughtDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Providers>(context);
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            onTap: (index) {
              provider.updatedIndex = index;
              // print(provider.currentIndex);
            },
            animationDuration: const Duration(milliseconds: 300),
            items: const [
              Icon(
                Icons.home,
              ),
              Icon(
                Icons.add,
              ),
              Icon(
                Icons.favorite,
              ),
            ]),
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () async {
              signOut();
            },
            icon: const Icon(Icons.power_settings_new),
          ),
        ]),
        body: pages[provider.currentIndex]);
  }
}
