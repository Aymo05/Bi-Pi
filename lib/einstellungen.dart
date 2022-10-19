// Einstellungen Seite
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

class Einstellungen extends StatelessWidget {
  const Einstellungen({Key? key}) : super(key: key);

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
                    Icons.menu,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Menu()));
                  },
                ),
              ),
              const SizedBox(
                width: 100,
                height: 120,
                child: Image(
                    image: AssetImage(
                  'assets/images/Pfadililie.png',
                )),
              ),
            ],
          ),
          SizedBox(
            width: 300,
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
    );
  }
}
