import 'package:attendance_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
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

class _SettingsState extends State<Settings> {
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
                    return Settings();
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
