import 'package:attendance_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: mainstuff(),
    );
  }
}

class mainstuff extends StatefulWidget {
  const mainstuff({super.key});

  @override
  State<mainstuff> createState() => _mainstuffState();
}

class _mainstuffState extends State<mainstuff> {
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
