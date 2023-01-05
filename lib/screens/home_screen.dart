import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  child: Icon(
                FontAwesomeIcons.locationDot,
                color: Colors.white,
              )),
              SizedBox(
                width: 100.0,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchScreen();
                      }));
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.white,
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 25.0),
            child: Column(
              children: [
                Text(
                  'Nigeria, Benin',
                  style: TextStyle(
                      color: Colors.white, fontSize: 18.0, letterSpacing: 1.5),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'January 01, 2003',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '100 °C',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 70.0,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'clear',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF0e0e30),
                    ),
                    height: 100.0,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Column(
                      children: [
                        Text(
                          'Wind',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '10Km/h',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF0e0e30),
                    ),
                    height: 100.0,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Column(
                      children: [
                        Text(
                          'Pressure',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '10Km/h',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF0e0e30),
                    ),
                    height: 100.0,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Column(
                      children: [
                        Text(
                          'Humidity',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '75%',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
