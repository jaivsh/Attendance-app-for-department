import 'package:attendance_app/mainstuff.dart';
import 'package:attendance_app/prof_alerts.dart';
import 'package:attendance_app/register_screen.dart';
import 'package:attendance_app/settings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendance_app/utilities/constants.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color _favIconColor = Colors.deepPurpleAccent;
  int _currentIndex = 0;
  static double currentatt = 0.50;

  List cardList = [Item1(), Item2(), Item3(), Item4()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  String username = "Jaivardhan Shukla";
  static int academicnotofications = 1;

  @override
  void initState() {
    _showouternotifications(context);
    super.initState();
  }

  _showouternotifications(BuildContext context) async {
    try {
      await FlutterDynamicIcon.setApplicationIconBadgeNumber(
          academicnotofications);
    } on PlatformException {
      print('Exception: platform not supported for icon badge');
    } catch (e) {
      print(e);
    }
  }

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
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(),
                    pageBuilder: (BuildContext context, _, __) {
                      return HomeScreen();
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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        actions: [
          Badge(
              elevation: 0,
              showBadge: academicnotofications == 0 ? false : true,
              animationType: BadgeAnimationType.fade,
              shape: BadgeShape.circle,
              animationDuration: const Duration(seconds: 1),
              badgeColor: Colors.orangeAccent,
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              badgeContent: Text('$academicnotofications'),
              position: BadgePosition.topStart(),
              child: IconButton(
                onPressed: () {
                  _showouternotifications(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfAlert()),
                  );
                },
                icon: Icon(
                  Icons.notifications_active,
                  color: _favIconColor,
                ),
                color: Colors.black,
                tooltip: 'Show notifications',
                highlightColor: Colors.black,
              ))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Hi, $username',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Scaffold(
          body: Column(
        children: <Widget>[
          GFCarousel(
            autoPlay: true,
            hasPagination: true,
            enlargeMainPage: true,
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      child: Card(
                        color: Colors.deepOrange,
                        elevation: 10,
                        child: card,
                      ),
                    ));
              });
            }).toList(),
            onPageChanged: (index) {
              setState(() {
                index;
              });
            },
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'All Courses Enrolled',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen1()),
                        );
                      },
                      child: Material(
                          elevation: 30,
                          child: ListTile(
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              leading: const Icon(CupertinoIcons.doc_on_doc),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: const BorderSide(color: Colors.white)),
                              trailing: const Text(
                                "GFG",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 132, 255),
                                    fontSize: 15),
                              ),
                              title: titleofcourses(index))));
                }),
          )
        ],
      )),
    );
  }
}

Widget titleofcourses(int index) {
  if (index == 0) {
    return const Text('IMT (DC)');
  } else if (index == 1) {
    return const Text('UMM (DC)');
  } else if (index == 2) {
    return const Text('UCM (DC)');
  } else if (index == 3) {
    return const Text('Statistics (DC)');
  } else if (index == 4) {
    return const Text('Electronics in mine (DC)');
  } else {
    return const Text('Data Structures (OC)');
  }
}

class Item1 extends StatelessWidget {
  Item1({super.key});
  double curatt = _HomeScreenState.currentatt;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrange,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("IMT",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, right: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: curatt,
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        valueColor: const AlwaysStoppedAnimation(
                            Color.fromARGB(255, 255, 208, 0)),
                        strokeWidth: 12,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your current attendance: ${curatt * 100}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Classes attended: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class Item2 extends StatelessWidget {
  Item2({super.key});
  double curatt = _HomeScreenState.currentatt;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrange,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Mine Machinery",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, right: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: curatt,
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        valueColor: const AlwaysStoppedAnimation(
                            Color.fromARGB(255, 255, 208, 0)),
                        strokeWidth: 12,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your current attendance: ${curatt * 100}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Classes attended: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class Item3 extends StatelessWidget {
  Item3({super.key});
  double curatt = _HomeScreenState.currentatt;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrange,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Underground Metalliferous Mining",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, right: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        value: 0.4,
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                        strokeWidth: 12,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Your current attendance: ${0.4 * 100}%',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Classes attended: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class Item4 extends StatelessWidget {
  Item4({super.key});
  double curatt = _HomeScreenState.currentatt;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Colors.deepOrange,
                  Colors.deepOrangeAccent,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("IMT",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, right: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: curatt,
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        valueColor: const AlwaysStoppedAnimation(Colors.amber),
                        strokeWidth: 12,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your current attendance: ${curatt * 100}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Classes attended: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
