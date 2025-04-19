import 'dart:ui';
import 'package:flutter/material.dart';
import 'default_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/login/s1.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Optional: Rounded corners
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur intensity
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.83,
                    color: Colors.cyanAccent.withOpacity(0.3), // Background color with transparency
                    child: Column(
                      children: [
                        Text('Roadify',
                          style: TextStyle(
                              color:Colors.white,fontSize: 60,fontWeight: FontWeight.bold),
                        ),
                        defaultEditText(
                          hintText: 'Full Name',
                          controller: _loginController,
                        ),
                        defaultEditText(
                          hintText: 'Address',
                          controller: _loginController,
                        ),
                        defaultEditText(
                          hintText: 'Phone',
                          controller: _loginController,
                        ),
                        defaultEditText(
                          hintText: 'User Name',
                          controller: _loginController,
                        ),
                        defaultEditText(
                          hintText: 'Password',
                          controller: _passwordController,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                          ),
                          child: Text("Sign Up",
                            style: TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',style: TextStyle(color: Colors.grey[300]),),
                            TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text('Login',style: TextStyle(color: Colors.white))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

