import 'package:attendance_app/helppage.dart';
import 'package:attendance_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Settingspage extends StatefulWidget {
  Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

Widget _notificationsList(
  List<int> titles,
) {
  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      final item = titles[index];
      return Card(
        child: ListTile(
          title: Text(item.toString()),
          onTap: () {
            //                                  <-- onTap
          },
          onLongPress: () {
            //                            <-- onLongPress
          },
        ),
      );
    },
  );
}

class _SettingspageState extends State<Settingspage> {
  Color _colorContainer = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          gap: 10,
          backgroundColor: Colors.deepPurpleAccent,
          color: Colors.white,
          activeColor: Colors.amberAccent,
          tabs: [
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  opaque: true,
                  transitionDuration: const Duration(),
                  pageBuilder: (BuildContext context, _, __) {
                    return Settingspage();
                  },
                ));
              },
            ),
            GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(),
                    pageBuilder: (BuildContext context, _, __) {
                      return const HomeScreen();
                    },
                  ));
                })
          ]),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Ink(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: InkWell(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    color: _colorContainer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Application FAQ\'s',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Help related to the application\'s usage and functionality',
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpPage()),
                  );
                  setState(() {
                    _colorContainer = _colorContainer == Colors.white
                        ? Colors.white38
                        : Colors.white;
                  });
                },
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Card(
              elevation: 10,
              child: Expanded(
                flex: 0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    'LOGOUT',
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () => {},
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
