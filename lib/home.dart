// Home Seite
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(139, 34, 82, 100),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                height: 100,
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Menu()));
                  },
                ),
              ),
              const SizedBox(
                width: 100,
                height: 120,
                child: Image(
                    image: AssetImage(
                  'assets/images/Pfadililie.png',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
                child: Text(
                  'Eingeloggt als:',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
                width: 5,
              ),
              SizedBox(
                height: 20,
                child: Text(
                  user.email!,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Text(
                    'Willkommen bei Bi-Pi. Hier kannst du deine Übungen von der Pfadi, sei es vom Sommerlager oder von einem Samstagnachmittag hochladen und mit anderen Pfadis teilen.',
                    style: TextStyle(color: Colors.yellowAccent, fontSize: 17),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
