// Menu Seite
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'einstellungen.dart';
import 'hochladen.dart';
import 'home.dart';
import 'suchen.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: 70,
                child: IconButton(
                  icon: const Icon(
                    Icons.menu_open,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Hochladen()));
                  },
                  child: const Text(
                    'Hochladen',
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Suchen()));
                  },
                  child: const Text(
                    'Suchen',
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Einstellungen()));
                  },
                  child: const Text(
                    'Einstellungen',
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.arrow_back, size: 32),
                  label: const Text(
                    'Ausloggen',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
