import 'package:attendance_app/profNotiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'profalert_view.dart';
import 'package:intl/intl.dart';

class ProfAlert extends StatefulWidget {
  const ProfAlert({super.key});

  @override
  State<ProfAlert> createState() => _ProfAlertState();
}

final List<Trip> tripsList = [
  Trip(
      "Prof. Ritesh Lokhande",
      DateTime.now(),
      DateTime.now(),
      "IMT (DC)",
      "Please make sure everybody attends the next class, nobody comes to my classes these days u biches!",
      "car"),

  Trip(
      "Prof. Abhishek Banerjee",
      DateTime.now(),
      DateTime.now(),
      "Chemistry (BS)",
      "I'm giving you suck up grades, u phaine bitches!",
      "plane"),
  //Trip("Washington D.C.", DateTime.now(), DateTime.now(), 900.00, "bus"),
  //Trip("Austin", DateTime.now(), DateTime.now(), 170.00, "car"),
  //Trip("Scranton", DateTime.now(), DateTime.now(), 180.00, "car"),
];

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      const ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/sun.jpg'),
        ),
        title: Text('Sun'),
      ),
      const ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/moon.jpg'),
        ),
        title: Text('Moon'),
      ),
      const ListTile(
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
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Alerts automatically disappear after it's deadline has passed!!"),
            ));
          },
          onLongPress: () {
            //                            <-- onLongPress
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Alerts automatically disappear after it's deadline has passed!!"),
            ));
          },
        ),
      );
    },
  );
}

Widget buildTripCard(BuildContext context, int index) {
  final trip = tripsList[index];
  //tripsList.removeWhere(
  //(element) => trip.endDate == DateTime.now(),
  //);
  return Card(
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Row(children: <Widget>[
              Text(
                trip.title,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
              //const Spacer(),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 15.0),
            child: Row(children: <Widget>[
              Text(
                  "${DateFormat("yyyy-MM-dd hh:mm:ss").format(trip.startDate)} - ${trip.subject}"),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    trip.description.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 8.0),
            child: Row(
              children: <Widget>[
                const Spacer(),
                const Icon(CupertinoIcons.book),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class _ProfAlertState extends State<ProfAlert> {
  int counter = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: const Text(
          'Departmental Alerts',
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
                  return buildTripCard(context, index);
                }),
          )
        ]),
      ),
    );
  }
}
