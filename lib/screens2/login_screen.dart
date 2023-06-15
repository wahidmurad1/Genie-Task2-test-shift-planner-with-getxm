import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_task/controller/login_controller.dart';
import 'package:genie_task/screens2/home_screen2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  // bool isLogin = false;
  //TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Shift Planner',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter Your Credentials to Access Your Account",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white, //Color(0xFFFFFFFF)
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  height: 50,
                  child: TextField(
                    controller: loginController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black38,
                        size: 17,
                      ),
                      hintText: "Example@domain.com",
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white, //Color(0xFFFFFFFF)
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  height: 50,
                  child: TextField(
                    controller: loginController.passwordController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 15),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black38,
                        size: 17,
                      ),
                      hintText: "6+ Strong Character",
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Obx(() => Container(
                      margin: EdgeInsets.only(top: 25),
                      width: 400,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          // SharedPreferences sharedPreferences =
                          //     await SharedPreferences.getInstance();
                          // sharedPreferences.setString(
                          //     'email', loginController.emailController.text);
                          // loginController.getValidationData();
                          loginController.loginUser();
                        },
                        child: Center(
                          child: loginController.isLoading.value
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Please Wait...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> loginUser() async {
  //   String Link = "https://dev-api.limadi.dk/api/v1/auth/login";
  //   var data = {
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //   };
  //   final value = jsonEncode(data);
  //   var urlParse = Uri.parse(Link);
  //   var response = (await http.post(urlParse,
  //       body: value,
  //       headers: {'content-type': 'application/json', 'app-role': 'company'}));
  //   print(response.body);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     Get.to(() => HomeScreen2());
  //     Fluttertoast.showToast(msg: "Login Successful");
  //   } else {
  //     Get.to(() => LoginScreen());
  //     Fluttertoast.showToast(msg: "Login Failed");
  //   }
  //  // update();
  // }
}
