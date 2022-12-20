import 'package:attendance_app/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:io';

class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen1> {
  String valuechoose = '';
  List listitem = ['pdf', 'sheet'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          gap: 5,
          backgroundColor: Colors.deepPurpleAccent,
          color: Colors.white,
          activeColor: Colors.amberAccent,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: null,
            ),
            GButton(
              icon: Icons.notification_important,
              text: 'Notifications',
              onPressed: null,
            ),
            GButton(
              icon: Icons.import_export,
              text: 'Export table',
              onPressed: () {
                showAlertDialog(
                    context,
                    'Please select your export format and continue',
                    "Export table",
                    "Ok",
                    "Cancel");
              },
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              onPressed: null,
            ),
          ]),
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
                    color: Colors.deepPurpleAccent,
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

  showAlertDialog(BuildContext context, String message, String heading,
      String buttonAcceptTitle, String buttonCancelTitle) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text(buttonCancelTitle),
      onPressed: () {},
    );
    Widget continueButton = ElevatedButton(
      child: Text(buttonAcceptTitle),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: Text(message),
      actions: [
        DecoratedBox(
            decoration: BoxDecoration(
                color: Colors
                    .deepPurpleAccent, //background color of dropdown button
                border: Border.all(
                    color: Colors.white, width: 3), //border of dropdown button
                borderRadius: BorderRadius.circular(
                    50), //border raiuds of dropdown button
                boxShadow: const <BoxShadow>[
                  //apply shadow on Dropdown button
                  BoxShadow(
                      color: Colors.black87, //shadow for button
                      blurRadius: 5) //blur radius of shadow
                ]),
            child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: DropdownButton(
                  value: "PDF",
                  items: const [
                    //add items in the dropdown
                    DropdownMenuItem(
                      child: Text("PDF"),
                      value: "PDF",
                    ),
                    DropdownMenuItem(child: Text("SHEET"), value: "SHEET"),
                  ],
                  onChanged: (value) {
                    //get value when changed
                    print("You have selected $value");
                  },
                  icon: Padding(
                      //Icon at tail, arrow bottom is default icon
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.arrow_downward_outlined)),
                  iconEnabledColor: Colors.white, //Icon color
                  style: TextStyle(
                      //te
                      color: Colors.white, //Font color
                      fontSize: 20 //font size on dropdown button
                      ),

                  dropdownColor:
                      Colors.deepPurpleAccent, //dropdown background color
                  underline: Container(), //remove underline
                  isExpanded: true, //make true to make width 100%
                ))),
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
