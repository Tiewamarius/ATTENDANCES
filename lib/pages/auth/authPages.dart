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
          body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton.icon(
            onPressed: () {
              Get.to(Login());
            },
            label: Text(
              "LOGIN",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            icon: Icon(
              Icons.lock_clock,
              size: 25,
              color: Colors.red,
            ),
          ),
          SizedBox( width: 25,),
          TextButton.icon(
            onPressed: () {
              Get.to(Register());
            },
            label: Text(
              "REGISTER",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            icon: Icon(
              Icons.pending_actions_sharp,
              size: 25,
              color: Colors.red,
            ),
          ),
        ],
      ),),
    );
  }
}
