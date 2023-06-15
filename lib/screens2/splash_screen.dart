import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_task/controller/login_controller.dart';
import 'package:genie_task/controller/splash_screen_controller.dart';
import 'package:genie_task/screens2/home_screen2.dart';
import 'package:genie_task/screens2/login_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  SplashScreenController splashScreenController=Get.put(SplashScreenController());
  //SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          'assets/images/splashscreen.jpeg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


