import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  IconData location = FontAwesomeIcons.locationDot;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF060628),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 65.0),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Text(
                  'Pick Location',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30.0,
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Find the are or city that you want to know the detailed weather info at this time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17.0,
                    color: Colors.white
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 60.0,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xFF0e0e30),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.search,
                                color: Color(0xFFD4D3EF),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Color(0xFFD4D3EF)),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFD4D3EF)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xFF0e0e30)),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: Color(0xFFD4D3EF),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
