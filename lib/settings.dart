import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/sun.jpg'),
        ),
        title: Text('Sun'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/moon.jpg'),
        ),
        title: Text('Moon'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/stars.jpg'),
        ),
        title: Text('Star'),
      ),
    ],
  );
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
      bottomNavigationBar: const GNav(
          gap: 10,
          backgroundColor: Colors.deepPurpleAccent,
          color: Colors.white,
          activeColor: Colors.amberAccent,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ]),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: []),
      ),
    );
  }
}
