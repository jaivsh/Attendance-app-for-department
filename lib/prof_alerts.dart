import 'package:attendance_app/forgotpassword.dart';
import 'package:attendance_app/home_screen.dart';
import 'package:attendance_app/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendance_app/utilities/constants.dart';

class ProfAlert extends StatefulWidget {
  const ProfAlert({super.key});

  @override
  State<ProfAlert> createState() => _ProfAlertState();
}

class _ProfAlertState extends State<ProfAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts from Professors')),
    );
  }
}
