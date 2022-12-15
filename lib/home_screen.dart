import 'package:attendance_app/register_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendance_app/utilities/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.all(11.0),
          child: ClipOval(
            child: Image(
              image: AssetImage('assets/images/waving_hand.png'),
            ),
          ),
        ),
        title: const Text(
          'Hi, BT21MIN001',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Scaffold(
          body: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 170.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: card,
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(cardList, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }),
          ),
          Container(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'All Courses Enrolled',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
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
    return Text('IMT (DC)');
  } else if (index == 1) {
    return Text('UMM (DC)');
  } else if (index == 2) {
    return Text('UCM (DC)');
  } else if (index == 3) {
    return Text('Statistics (DC)');
  } else if (index == 4) {
    return Text('Electronics in mine (DC)');
  } else {
    return Text('Data Structures (OC)');
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Color.fromARGB(255, 134, 214, 254),
                  Color.fromARGB(255, 7, 185, 255),
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
                        padding: EdgeInsets.only(left: 30),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            SizedBox(
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Color.fromARGB(255, 134, 214, 254),
                  Color.fromARGB(255, 7, 185, 255),
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
                        padding: EdgeInsets.only(left: 30),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            SizedBox(
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Color.fromARGB(255, 134, 214, 254),
                  Color.fromARGB(255, 7, 185, 255),
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
                      CircularProgressIndicator(
                        value: 0.4,
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        valueColor: const AlwaysStoppedAnimation(
                            Color.fromARGB(255, 255, 208, 0)),
                        strokeWidth: 12,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your current attendance: ${0.4 * 100}%',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            SizedBox(
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Color.fromARGB(255, 134, 214, 254),
                  Color.fromARGB(255, 7, 185, 255),
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
                        padding: EdgeInsets.only(left: 30),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total classes: ${curatt * 100}',
                              style: const TextStyle(color: Colors.black),
                            ),
                            SizedBox(
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
