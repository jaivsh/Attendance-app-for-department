import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ProfAlert extends StatefulWidget {
  const ProfAlert({super.key});

  @override
  State<ProfAlert> createState() => _ProfAlertState();
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

class _ProfAlertState extends State<ProfAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text(
          'Academic Alerts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: []),
      ),
    );
  }
}
