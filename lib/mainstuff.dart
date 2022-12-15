import 'package:attendance_app/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMT(DC)'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Professor:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  ' Dr. Ritesh Lokhande',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Total Classes Attended:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      ' 12/15',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Attendance Percentage:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      ' 80.0 %',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),
            Flexible(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(columns: const [
                      DataColumn(
                        label: Text('Serial'),
                      ),
                      DataColumn(
                        label: Text('Date'),
                      ),
                      DataColumn(
                        label: Text('Presentees'),
                      ),
                      DataColumn(
                        label: Text('Absentees'),
                      ),
                      DataColumn(
                        label: Text('Time of Attendance'),
                      ),
                    ], rows: const [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('2/1/23')),
                        DataCell(Text('P')),
                        DataCell(Text('A')),
                        DataCell(Text('12:29:12 PM'))
                      ])
                    ])))
          ],
        ),
      ),
    );
  }
}
