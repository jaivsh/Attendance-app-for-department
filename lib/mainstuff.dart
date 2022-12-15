import 'package:attendance_app/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 15,
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(50)),
              child: Container(
                height: 110,
                width: (MediaQuery.of(context).size.width) / 1.1,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 5, top: 5),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Professor:',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          Text(
                            ' Dr. Ritesh Lokhande',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          )
                        ],
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total Classes Attended:',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Text(
                                ' 12/15',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              )
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Attendance Percentage:',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Text(
                                ' 80.0 %',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              )
                            ],
                          ))
                    ])),
              ),
            ),
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
                        DataCell(Text('-')),
                        DataCell(Text('12:29:12 PM'))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('2/1/23')),
                        DataCell(Text('-')),
                        DataCell(Text('A')),
                        DataCell(Text('12:29:12 PM'))
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3')),
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
