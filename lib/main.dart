import 'dart:ffi';

import 'package:attendance_app/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: mainstuff(),
    );
  }
}

class mainstuff extends StatefulWidget {
  mainstuff({super.key});

  late DocumentSnapshot snapshot;

  @override
  State<mainstuff> createState() => _mainstuffState();
}

class _mainstuffState extends State<mainstuff> {
  List userslist = [];

  void getlogindata() async {
    await FirebaseFirestore.instance
        .collection('student-side')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        userslist.add(element);
      });
    });
    print('List is here: ${userslist}');
  }

  @override
  void initState() {
    super.initState();
    getlogindata();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      title: const Text(
        'Attendances',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/vnitnagpurlogo.png'),
      navigateAfterSeconds: LoginScreen(),
      loaderColor: Colors.blue,
      photoSize: 100.0,
    );
  }
}

class originalScreen extends StatefulWidget {
  const originalScreen({super.key});

  @override
  State<originalScreen> createState() => _originalScreenState();
}

class _originalScreenState extends State<originalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Attendances')),
        body: Center(
          child: SafeArea(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.blue)))),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
