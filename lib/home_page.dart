import 'package:car_system/CarScreens/car_screen.dart';
import 'package:car_system/AutoPartScreens/auto_part_screen.dart';
import 'package:car_system/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'maintenance_screen.dart';

class الشاشةالرئيسية extends StatefulWidget {
  @override
  State<الشاشةالرئيسية> createState() => _حالة_الشاشةالرئيسية();
}

class _حالة_الشاشةالرئيسية extends State<الشاشةالرئيسية> {
  List<String> عناوين_التطبيق = [
    'السيارات',
    'قطع الغيار',
    'الصيانة',
    'الملف الشخصي',
  ];

  List<Widget> شاشات_التطبيق = [
    CarScreen(),
    AutoPartScreen(),
    MaintenanceScreen(),
    ProfileScreen(),
  ];

  int المؤشر = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 20, top: 10),
        child: GNav(
          onTabChange: (القيمة) {
            setState(() {
              المؤشر = القيمة;
            });
          },
          tabBorderRadius: 15,
          curve: Curves.easeOutExpo,
          duration: Duration(milliseconds: 400),
          gap: 8,
          color: Colors.white,
          activeColor: Colors.white,
          iconSize: 24,
          tabBackgroundColor: Colors.grey.withOpacity(0.1),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tabs: [
            GButton(
              icon: Icons.directions_car_outlined,
              text: عناوين_التطبيق[0],
            ),
            GButton(
              icon: Icons.home_repair_service_outlined,
              text: عناوين_التطبيق[1],
            ),
            GButton(
              icon: Icons.build_outlined,
              text: عناوين_التطبيق[2],
            ),
            GButton(
              icon: Icons.person_outline,
              text: عناوين_التطبيق[3],
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          المؤشر != 3
              ? Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/SSimage/s1.png'),
                  ),
                )
              : SizedBox(),
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          عناوين_التطبيق[المؤشر],
          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: شاشات_التطبيق[المؤشر],
    );
  }
}
