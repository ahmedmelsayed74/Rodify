import 'package:car_system/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     /* appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red),
            onPressed: () {
              // Handle logout logic
            },
          )
        ],
      ),*/
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfilePicture(),
            SizedBox(height: 16),
            _buildUserInfo(),
            SizedBox(height: 20),
            _buildProfileOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/SSimage/s1.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 18,
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.white, size: 16),
                onPressed: () {
                  // Handle profile picture change
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      children: [
        Text(
          "احمد عثمان",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "ahmed.othman99@email.com",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
      _buildOptionTile(Icons.person, "تعديل الملف الشخصي", () {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditProfileScreen(
        name: "احمد سامي",
        email: "ahmed.samy@email.com",
        phone: "01012345678",
        password: "12345678",
        address: "القاهرة، مصر",
      ),
    ),
  );
}),

        _buildOptionTile(Icons.security, "اعدادات الخصوصية", () {}),
        _buildOptionTile(Icons.payment, "طرق الدفع", () {}),
        _buildOptionTile(Icons.notifications, "اعدادات الاشعارات", () {}),
        _buildOptionTile(Icons.help, "المساعدة والدعم", () {}),
        _buildOptionTile(Icons.logout, "تسجيل خروج", () {
          _showLogoutConfirmation(context);
        }, isLogout: true),
      ],
    );
  }

  Widget _buildOptionTile(IconData icon, String title, VoidCallback onTap,
      {bool isLogout = false}) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : Colors.white),
        title: Text(title,
            style: TextStyle(
                color: isLogout ? Colors.red : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios,
            color: isLogout ? Colors.red : Colors.white54),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text("تسجيل الخروج", style: TextStyle(color: Colors.white)),
        content: Text("هل انت متاكد من تسجيل الخروج؟",
            style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            child: Text("الغاء", style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text("تسجيل الخروج", style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
