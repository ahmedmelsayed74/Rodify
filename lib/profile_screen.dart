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
          "Ahmed Samy",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "ahmed.samy@email.com",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        _buildOptionTile(Icons.person, "Edit Profile", () {}),
        _buildOptionTile(Icons.security, "Privacy Settings", () {}),
        _buildOptionTile(Icons.payment, "Payment Methods", () {}),
        _buildOptionTile(Icons.notifications, "Notification Settings", () {}),
        _buildOptionTile(Icons.help, "Help & Support", () {}),
        _buildOptionTile(Icons.logout, "Logout", () {
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
        title: Text("Logout", style: TextStyle(color: Colors.white)),
        content: Text("Are you sure you want to logout?",
            style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            child: Text("Cancel", style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text("Logout", style: TextStyle(color: Colors.red)),
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
