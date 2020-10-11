import 'package:http/http.dart';

import "home_screen.dart";
import "cautions_screen.dart";

import "package:flutter/material.dart";
import "package:curved_navigation_bar/curved_navigation_bar.dart";

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> bottomWidget;

  int _selectedIndex = 0;

  @override
  void initState() {
    bottomWidget = [
      HomeScreen(),
      CautionsScreen(),
    ];
    // TODO: implement initState
    super.initState();
  }

  void getWidget(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Tracker"),
      ),
      body: bottomWidget[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        color: Color.fromRGBO(173, 181, 189, 0.4),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromRGBO(173, 181, 189, 0.4),
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(
            Icons.home,
            size: 28,
          ),
          Icon(
            Icons.description,
            size: 28,
          ),
        ],
        onTap: getWidget,
      ),
    );
  }
}
