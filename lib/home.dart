// Home Seite
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
      backgroundColor: const Color.fromRGBO(0, 191, 255, 100),
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
                height: 8,
                child: Text(
                  'Eingeloggt als',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
                child: Text(
                  user.email!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                width: 100,
                height: 120,
                child: Image(
                    image: AssetImage(
                  'assets/images/Pfadischweiz.jpg',
                )),
              ),
            ],
          ),
          const Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Text(
                'Willkommen bei Bi-Pi. Hier kannst du deine Übungen von der Pfadi, sei es vom Sommerlager oder von einem Samstagnachmittag hochladen und mit anderen Pfadis teilen.',
                style: TextStyle(color: Colors.yellowAccent, fontSize: 17),
              ),
            ),
          ),
          const Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Text('                  '),
            ),
          ),
          const SizedBox(
            height: 80,
            child: Text('          '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const FractionallySizedBox(
                widthFactor: 0.4,
                child: Image(
                    image: AssetImage(
                  'assets/images/Geländegame.jpg',
                )),
              ),
              const FractionallySizedBox(
                widthFactor: 0.4,
                child: Image(
                    image: AssetImage(
                  'assets/images/Geländegame2.jpg',
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
