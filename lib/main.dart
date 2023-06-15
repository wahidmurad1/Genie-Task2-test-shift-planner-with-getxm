import 'package:flutter/material.dart';
import 'package:genie_task/controller/login_controller.dart';
import 'package:genie_task/screens2/home_screen2.dart';
import 'package:genie_task/screens2/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Genie Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => HomeScreen2()),
      ],
      home: SplashScreen(),
    );
  }
}
