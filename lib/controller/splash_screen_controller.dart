import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_task/controller/login_controller.dart';
import 'package:genie_task/screens2/home_screen2.dart';
import 'package:genie_task/screens2/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  String? token;
  LoginController loginController = Get.put(LoginController());
  @override
  void onInit() {
    // TODO: implement onInit
    isLogin();
    super.onInit();
  }

  isLogin() async {
    //await loginController.removeToken();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Timer(Duration(seconds: 3), () {
      if (sharedPreferences.getString('token') == null) {
        Get.offAll(() => LoginScreen());
        print("token is Null");
      } else {
        //print(sharedPreferences.getString('token'));
        print("Already Logged In");
        Fluttertoast.showToast(msg: "Already Logged In");
        Get.offAll(() => HomeScreen2());
      }
    });
  }
}
