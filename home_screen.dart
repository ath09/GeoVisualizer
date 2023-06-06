import 'package:flutter/material.dart';
import 'package:geovisualizer_lg/configs/themes/app_color.dart';
import 'package:geovisualizer_lg/map_screen.dart';
import 'package:geovisualizer_lg/search_country.dart';
import 'package:geovisualizer_lg/settings_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  RangeValues values = RangeValues(1980, 2020);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
        body: Center(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 300,
                                      ),
                                      const Image(
                                        image: AssetImage('images/logolg.png'),
                                        height: 150,
                                        width: 150,
                                      ),
                                      SizedBox(
                                        width: 200,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Settings()));
                                          },
                                          icon: Icon(Icons.settings)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  /*RangeSlider(
                                      values: values,
                                      labels: labels,
                                      divisions: 8,
                                      activeColor: Colors.amber,
                                      inactiveColor: Colors.amberAccent,
                                      min: 1980,
                                      max: 2020,
                                      onChanged: (newValue) {
                                        values = newValue;
                                        print('${newValue.start},${newValue.end}');
                                        setState(() {});
                                      }),*/
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MapScreen()));
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Colors.black;
                                          }
                                          return const Color.fromARGB(
                                              255, 86, 213, 241);
                                        })),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Text(
                                              "Population Evolution Map",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MapScreen()));
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Colors.black;
                                          }
                                          return const Color.fromARGB(
                                              255, 86, 213, 241);
                                        })),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Text(
                                              "War Evolution Map",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MapScreen()));
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Colors.black;
                                          }
                                          return const Color.fromARGB(
                                              255, 86, 213, 241);
                                        })),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Text(
                                              "Territory Expansion Map",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MapScreen()));
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return Colors.black;
                                          }
                                          return const Color.fromARGB(
                                              255, 86, 213, 241);
                                        })),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Text(
                                              "Industrialization Map",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]))))),
          )),
    ));
  }
}
