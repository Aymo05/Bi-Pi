// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, avoid_unnecessary_containers, unnecessary_this, unused_import, unnecessary_import, avoid_print, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_const_declarations, unused_catch_clause

import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
import 'home.dart';
import 'login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

// Startseite
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
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
