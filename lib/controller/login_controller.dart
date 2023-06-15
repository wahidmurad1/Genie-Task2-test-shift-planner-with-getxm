import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_task/screens2/home_screen2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //RxBool iconVisible = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? token;
  RxBool isLoading = false.obs;
  //SharedPreferences sharedPreferences= SharedPreferences.getInstance();

  loginUser() async {
    isLoading.value = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String Link = "https://dev-api.limadi.dk/api/v1/auth/login";
    var data = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    print(data);
    final value = json.encode(data);
    var urlParse = Uri.parse(Link);
    var response = (await http.Client().post(urlParse,
        body: (value),
        headers: {'content-type': 'application/json', 'app-role': 'company'}));
    final data2 = jsonDecode(response.body);

    print(response.body);
    print(response.statusCode);

    //if(response.statusCode==200)
    if (response.body.contains("\"code\":200")) {
      Get.offAll(() => HomeScreen2());
      sharedPreferences.setString('token', data2['data']['token']);
      token = sharedPreferences.getString('token');
      print(token);
      Fluttertoast.showToast(msg: "Login Successful");
      isLoading.value = false;
      print(token);
    } else {
      Fluttertoast.showToast(msg: "Login Failed");
      isLoading.value = false;
    }
    update();
  }

  Future<void> removeToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
  }
}
