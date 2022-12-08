import 'package:attendance_app/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendance_app/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hi, BT21MIN001',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: Column(children: [
          Card(
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            shadowColor: Colors.lightBlueAccent,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // widget goes here
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // some more widgets
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
