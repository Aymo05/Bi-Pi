// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, avoid_unnecessary_containers, unnecessary_this, unused_import, unnecessary_import, avoid_print, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_const_declarations, unused_catch_clause

import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// Startseite
class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?> (
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return AuthPage();
        }
      },
    ),
  );
}

class LoginMask extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginMask({
    Key? key, 
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginMaskState createState() => _LoginMaskState();
}
class _LoginMaskState extends State<LoginMask> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(139, 34, 82, 20),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Passwort'),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.lock_open, size: 32),
              label: Text(
                'Einloggen',
                style: TextStyle(fontSize: 24),
                ),
              onPressed: signIn,
            ),
            SizedBox(height: 24,),
            GestureDetector(
              child: Text(
                'Passwort vergessen?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),
                )),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 24),
                text: 'noch kein Account?',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Registrieren',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future signIn() async {
        try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(), 
            password: passwordController.text.trim()
          );
        } on FirebaseAuthException catch (e) {
          print('Email oder Passwort nich korrekt');
        }
      }
}

// Home Seite
class Home extends StatelessWidget {
  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
    backgroundColor: Color.fromRGBO(0, 191, 255, 100),
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
                  icon: Icon(
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
            SizedBox(
              height: 8,
              child: Text('Eingeloggt als',
              style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 8,
            ),

            SizedBox(
              height: 8,
              child: Text(user.email!,
              style: TextStyle(fontSize: 16),
              ),
            ),

            SizedBox(
            width: 100,
            height: 120,
             child: Image(
              image: AssetImage(
              'C:/Bi-Pi/demo_app/lib/assets/images/Pfadischweiz.jpg',)
                ),
            ),
            ],
          ),
          
          Flexible(
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Text('Willkommen bei Bi-Pi. Hier kannst du deine Übungen von der Pfadi, sei es vom Sommerlager oder von einem Samstagnachmittag hochladen und mit anderen Pfadis teilen.', 
              style: TextStyle(color: Colors.yellowAccent, fontSize: 17),
              ),
            ),
          ),

          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Text('                  '),
            ),
          ),

          SizedBox(
            height: 80,
            child: Text('          '),
          ),
          

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              FractionallySizedBox(
                widthFactor: 0.4,
                child: Image(
                  image: AssetImage('C:/Bi-Pi/demo_app/lib/assets/images/Geländegame.jpg',)
                ),
              ),
            
              FractionallySizedBox(
                widthFactor: 0.4,
                child: Image(
                  image: AssetImage('C:/Bi-Pi/demo_app/lib/assets/images/Geländegame2.jpg',)
                ),
              ),
              
              
            ],
          ),
            

          ],
        ), 
    );
  }
}


// Menu Seite
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(139, 34, 82, 100),
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
                    icon: Icon(
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

                SizedBox(
                  width: 100,
                  height: 120,
                  child: Image(
                    image: AssetImage(
                      'C:/Bi-Pi/demo_app/lib/assets/images/Pfadischweiz.jpg',)
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
                  child: TextButton(
                    onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Hochladen()));
                    },
                    child: Text('Hochladen',
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
                      Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Suchen()));
                    },
                    child: Text('Suchen',
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
                      Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Einstellungen()));
                    },
                    child: Text('Einstellungen',
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
                      minimumSize: Size.fromHeight(50),
                    ),
                    icon: Icon(Icons.arrow_back, size: 32),
                    label: Text(
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


// Hochladen Seite
class Hochladen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(139, 34, 82, 100),
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
                   icon: Icon(
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
              
              SizedBox(
                width: 100,
                height: 120,
                child: Image(
                  image: AssetImage(
                    'C:/Bi-Pi/demo_app/lib/assets/images/Pfadischweiz.jpg',)
                ),
              ),
            ],
          ),

        Flexible(
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Text('Hallo, hier sollte nun ganz viel Platz sein',
                style: TextStyle(fontSize: 15, backgroundColor: Colors.lightBlue, color: Colors.yellow),
              ),
            ),
        ),
        ],
      ),
    );
  }
}


// Suchen Seite
class Suchen extends StatelessWidget {
  var Stufe = ['Wölfe', 'Pfadi', 'Pio'];
  var Dauer = ['1-3h', '3-6h', '6+ h'];
  var Jahreszeit = ['Frühling', 'Sommer', 'Herbst', 'Winter'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(139, 34, 82, 100),
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
                   icon: Icon(
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
            Flexible(
              child: FractionallySizedBox(
              widthFactor: 0.7,
                child: Baseline(baseline: 10, baselineType: TextBaseline.alphabetic,
                  child: Text('Übung suchen',
                  style: TextStyle(fontSize: 20, color: Colors.yellowAccent),
                  ),
                ),
              ),
            ),
                          
              SizedBox(
                width: 100,
                height: 120,
                child: Image(
                  image: AssetImage(
                    'C:/Bi-Pi/demo_app/lib/assets/images/Pfadischweiz.jpg',)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Baseline(baseline: -10, baselineType: TextBaseline.alphabetic,
                  child: Text('Stufe',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Baseline(baseline: -10, baselineType: TextBaseline.alphabetic,
                  child: Text('Dauer',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Baseline(baseline: -10, baselineType: TextBaseline.alphabetic,
                  child: Text('Jahreszeit',
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
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                    iconSize: 25,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded, color: Colors.black,
                      ),
                    isExpanded: true,
                    items: Stufe.map((buildMenuItem)).toList(),
                    onChanged: (value) => setState (() => this.value = value),
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
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                    value: value,
                    iconSize: 25,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded, color: Colors.black,
                      ),
                    isExpanded: true,
                    items: Dauer.map(buildMenuItem).toList(),
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
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                    value: value,
                    iconSize: 25,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded, color: Colors.black,
                      ),
                    isExpanded: true,
                    items: Jahreszeit.map(buildMenuItem).toList(),
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
      child: Text(item, 
      style: TextStyle(fontSize: 20),
      ),
  );
  setState(String? Function() param0) {}
}


// Einstellungen Seite
class Einstellungen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(139, 34, 82, 100),
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
                   icon: Icon(
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
              
              SizedBox(
                width: 100,
                height: 120,
                child: Image(
                  image: AssetImage(
                    'C:/Bi-Pi/demo_app/lib/assets/images/Pfadischweiz.jpg',)
                ),
              ),
            ],
          ),

    
        ],
      ),
    );
  }
}

class AuthPage extends StatefulWidget{
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => 
    isLogin ? LoginMask(onClickedSignUp: toggle) 
    : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(139, 34, 82, 20),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) => 
                  email !=null && EmailValidator.validate(email)
                  ? 'Email ist nicht korrekt'
                  : null,
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: passwordController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Passwort'),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value !=null && value.length <6
                  ? 'Passwort muss mindestens 6 Zeichen lang sein'
                  : null,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.lock_open, size: 32),
                label: Text(
                  'Registrieren',
                  style: TextStyle(fontSize: 24),
                  ),
                onPressed: signUp,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  text: 'Bereits ein Account vorhanden?',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Einloggen',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
        try{
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(), 
            password: passwordController.text.trim()
          );
        } on FirebaseAuthException catch (e) {
          print('Email bereits vergeben');
        }
      }
}

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Erhalte eine Email um dein \n Passwort zurück zu setzen',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                email != null && !EmailValidator.validate(email)
                  ? 'Gültige Email angeben'
                  : null,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.email_outlined),
              label: Text(
                'Passwort zurücksetzen',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: resetPassword,
            ),
          ],
        ),
      ),
    );
  }
  Future resetPassword() async {
    try{
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print('Email wurde versendet');
    }
  }
}
