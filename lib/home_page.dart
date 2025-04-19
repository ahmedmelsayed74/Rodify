import 'package:car_system/CarScreens/car_screen.dart';
import 'package:car_system/AutoPartScreens/auto_part_screen.dart';
import 'package:car_system/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'maintenance_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>appTitle = [
    'Cars',
    'Auto Parts',
    'Maintenance',
    'Profile',
  ];

  List<Widget>appScreens = [
    CarScreen(),
    AutoPartScreen(),
    MaintenanceScreen(),
    ProfileScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.only(right: 10,left: 10,bottom:20,top:10),
        child: GNav(
          onTabChange: (val){
            setState(() {
              index = val;
            });
          },
            tabBorderRadius: 15,
           // tabActiveBorder: Border.all(color: Colors.cyanAccent, width: 1), // tab button border
           // tabBorder: Border.all(color: Colors.white, width: 1), // tab button border
           // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 400), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.white, // unselected icon color
            activeColor: Colors.white, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: Colors.grey.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.directions_car_outlined,
                text: appTitle[0],
              ),
              GButton(
                icon: Icons.home_repair_service_outlined,//Icons.flash_auto_outlined,
                text: appTitle[1],
              ),
              GButton(
                icon: Icons.build_outlined,
                text: appTitle[2],
              ),
              GButton(
                icon:Icons.person_outline,
                text: appTitle[3],
              )
            ]
        ),
      ),
      /* CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.directions_car_outlined, size: 30),
          Icon(Icons.flash_auto_outlined, size: 30),
          Icon(Icons.car_repair_outlined, size: 30),
          Icon(Icons.person_outline, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.directions_car_outlined),label: appTitle[0]),
            BottomNavigationBarItem(icon: Icon(Icons.flash_auto_outlined),label: appTitle[1]),
            BottomNavigationBarItem(icon: Icon(Icons.car_repair_outlined),label: appTitle[2]),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: appTitle[3]),
          ],
      ),*/
      appBar: AppBar(
        actions: [
          index!=3?Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/SSimage/s1.png'),
            ),
          ):SizedBox(),
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(appTitle[index],style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: appScreens[index],
    );
  }
}
