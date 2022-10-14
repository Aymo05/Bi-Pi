// Hochladen Seite
import 'package:flutter/material.dart';
import 'menu.dart';

class Hochladen extends StatelessWidget {
  const Hochladen({Key? key}) : super(key: key);

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
                  'assets/images/Pfadischweiz.jpg',
                )),
              ),
            ],
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Text(
                'Hallo, hier sollte nun ganz viel Platz sein',
                style: TextStyle(
                    fontSize: 15,
                    backgroundColor: Colors.lightBlue,
                    color: Colors.yellow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
