import 'package:attendances/pages/auth/login.dart';
import 'package:attendances/pages/auth/login.dart';
import 'package:attendances/pages/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPages extends StatefulWidget {
  const AuthPages({super.key});

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 200,
                child: Image.asset(
                  'images/Admin.png',
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Get.to(Login());
                          },
                          label: Text(
                            "MON ESPACE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color
                            foregroundColor: Colors.white, // Text color
                            textStyle: TextStyle(fontSize: 16), // Text style
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12), // Padding
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Rounded corners
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Get.to(Register());
                          },
                          label: Text(
                            "CREER COMPTE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Background color
                            foregroundColor: Colors.white, // Text color
                            textStyle: TextStyle(fontSize: 16), // Text style
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12), // Padding
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Rounded corners
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
