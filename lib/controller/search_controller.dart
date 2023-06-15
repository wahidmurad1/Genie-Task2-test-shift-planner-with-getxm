import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  // late ValueChanged onSubmit;
  // late ValueChanged<String> onChanged;
  // late VoidCallback onPressed;
  RxBool isIconVisible = false.obs;

  // onChanged(value) {
  //   globalvariables.runFilter(searchTextController.text);
  // }

  // onSubmit(value) {
  //   if (globalvariables.options.value.isNotEmpty) {
  //     globalvariables.isVisible = true;
  //   } else {
  //     globalvariables.isVisible = false;
  //   }
  //   update();
  // }

  List<Map<String, dynamic>> foundUsers = [];
  List<Map<String, dynamic>> result = [];
  void runFilter(String enteredKeyword) {
    //print(enteredKeyword);
    if (globalvariables.options.isEmpty) {
      print(enteredKeyword);
      if (enteredKeyword.toString().trim() == '') {
        foundUsers = globalvariables.allUser;
        result = foundUsers;
      } else {
        foundUsers = globalvariables.allUser
            .where((user) => user["name"]
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        result = foundUsers;
      }
    } else {
      print(enteredKeyword);
      if (enteredKeyword.toString().trim() == '') {
        foundUsers = result;
      } else {
        foundUsers = foundUsers
            .where((user) => user["name"]
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    }
    update();
    print(result);
  }

}
