import 'package:attendance_app/home_screen.dart';
import 'package:attendance_app/login_screen.dart';
import 'package:attendance_app/prof_alerts.dart';
import 'package:attendance_app/settings.dart' as setting;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:pdf/pdf.dart';
import 'dart:io';
//import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'savepdffile.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen1> {
  String valuechoose = 'pdf';
  List listitem = ['pdf', 'sheet'];

  Widget buildtable() {
    return DataTable(columns: const [
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
    ]);
  }

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
              onPressed: () {
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(),
                    pageBuilder: (BuildContext context, _, __) {
                      return new HomeScreen();
                    },
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return new SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(0, 100),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    }));
              },
            ),
            GButton(
              icon: Icons.notification_important,
              text: 'Notifications',
              onPressed: () {
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(),
                    pageBuilder: (BuildContext context, _, __) {
                      return new ProfAlert();
                    },
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return new SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(0, 100),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    }));
              },
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
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(),
                    pageBuilder: (BuildContext context, _, __) {
                      return setting.Settings();
                    },
                    transitionsBuilder:
                        (_, Animation<double> animation, __, Widget child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 100),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    }));
              },
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
                    scrollDirection: Axis.horizontal, child: buildtable()))
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
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text(buttonAcceptTitle),
      onPressed: () async {
        if (valuechoose == 'pdf')
          _createPDF();
        else {
          _createxcel();
        }
      },
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
                  BoxShadow(color: Colors.black87, blurRadius: 5)
                ]),
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: DropdownButtonFormField(
                  value: valuechoose,

                  items: listitem.map((foo) {
                    return DropdownMenuItem(
                      value: foo,
                      child: Text(foo),
                    );
                  }).toList(),
                  onChanged: (value) {
                    valuechoose = value.toString();
                    setState(() {
                      valuechoose;
                    });
                  },
                  icon: const Padding(
                      //Icon at tail, arrow bottom is default icon
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.arrow_downward_outlined)),
                  iconEnabledColor: Colors.white, //Icon color
                  style: const TextStyle(
                      color: Colors.white, //Font color
                      fontSize: 20 //font size on dropdown button
                      ),

                  dropdownColor:
                      Colors.deepPurpleAccent, //dropdown background color
                  //underline: Container(), //remove underline
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

  Future<void> _createxcel() async {}

  Future<void> _createPDF() async {
    PdfDocument doc = PdfDocument();
    final page = doc.pages.add();

    final PdfStringFormat format = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle);
    final Size pageSize = page.getClientSize();

    final PdfPen linePen =
        PdfPen(PdfColor(142, 170, 219, 255), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];

    page.graphics.drawString(
      'IMT (DC)',
      PdfStandardFont(PdfFontFamily.timesRoman, 30),
      bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
      format: format,
      brush: PdfBrushes.black,
    );
    page.graphics.drawImage(
        PdfBitmap(await _readImageData('vnitnagpurlogo.png')),
        Rect.fromLTWH(0, 0, 80, 80));

    page.graphics
        .drawLine(linePen, Offset(0, 100), Offset(pageSize.width, 100));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 18),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 5);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    header.style.textBrush = PdfBrushes.white;
    header.cells[0].value = 'Serial';
    header.cells[1].value = 'Date';
    header.cells[2].value = 'Presentees';
    header.cells[3].value = 'Absentees';
    header.cells[4].value = 'Time of Attendance';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = '1';
    row.cells[1].value = '2/1/23';
    row.cells[2].value = 'P';
    row.cells[3].value = '-';
    row.cells[4].value = '12:29:12 PM';

    row = grid.rows.add();
    row.cells[0].value = '2';
    row.cells[1].value = '2/1/23';
    row.cells[2].value = '-';
    row.cells[3].value = 'A';
    row.cells[4].value = '12:29:12 PM';

    row = grid.rows.add();
    row.cells[0].value = '3';
    row.cells[1].value = '2/1/23';
    row.cells[2].value = 'P';
    row.cells[3].value = 'A';
    row.cells[4].value = '12:29:12 PM';

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 130, 0, 0));

    List<int> bytes = doc.save();
    doc.dispose();
    var filename = DateTime.now().toString();
    saveandlaunchfile(bytes, filename);
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('assets/images/${name}');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
