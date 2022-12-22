import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'profalert_view.dart';

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
  int counter = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 6,
        title: const Text(
          'Academic Alerts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: counter,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        //Navigator.push(
                        // context,
                        //MaterialPageRoute(
                        //   builder: (context) => MainScreen1()),
                        //);
                      },
                      child: Material(
                          elevation: 300,
                          child: ListTile(
                              contentPadding: const EdgeInsets.only(
                                  left: 5, right: 5, bottom: 10),
                              leading: const Icon(CupertinoIcons.book),
                              tileColor: Colors.white24,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: const BorderSide(color: Colors.white)),
                              trailing: const Text(
                                "GFG",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 132, 255),
                                    fontSize: 15),
                              ),
                              title: Text('Astrazeneca'))));
                }),
          )
        ]),
      ),
    );
  }
}
