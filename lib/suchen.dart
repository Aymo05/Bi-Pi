// Suchen Seite
import 'package:flutter/material.dart';
import 'menu.dart';

class Suchen extends StatelessWidget {
  var stufe = ['Wölfe', 'Pfadi', 'Pio'];
  var dauer = ['1-3h', '3-6h', '6+ h'];
  var jahreszeit = ['Frühling', 'Sommer', 'Herbst', 'Winter'];
  String? value;

  Suchen({Key? key}) : super(key: key);

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
              const Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Baseline(
                    baseline: 10,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      'Übung suchen',
                      style:
                          TextStyle(fontSize: 20, color: Colors.yellowAccent),
                    ),
                  ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Baseline(
                    baseline: -10,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      'Stufe',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Baseline(
                    baseline: -10,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      'Dauer',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Baseline(
                    baseline: -10,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      'Jahreszeit',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                      iconSize: 25,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      items: stufe.map((buildMenuItem)).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                      dropdownColor: Colors.lightBlue,
                      iconEnabledColor: Colors.black87,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                      value: value,
                      iconSize: 25,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      items: dauer.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                      dropdownColor: Colors.lightBlue,
                      iconEnabledColor: Colors.black87,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                      value: value,
                      iconSize: 25,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      items: jahreszeit.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                      dropdownColor: Colors.lightBlue,
                      iconEnabledColor: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 20),
        ),
      );
  setState(String? Function() param0) {}
}
