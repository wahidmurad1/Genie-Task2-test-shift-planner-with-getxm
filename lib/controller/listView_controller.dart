import 'package:genie_task/const/global_variable.dart';
import 'package:get/get.dart';

class ListViewController extends GetxController {
  GlobalVariables globalVariables = Get.put(GlobalVariables());
  RxList findUser = RxList([]);
  @override
  void onInit() {
    // TODO: implement onInit
    // findUser.value = globalvariables.allUser;
    foundUsers.value = globalvariables.allUser;
    super.onInit();
  }

  RxList foundUsers = RxList([]);
  RxList result = RxList([]);
  void runFilter(String enteredKeyword) {
    //print(enteredKeyword);
    if (globalvariables.options.isEmpty) {
      print(enteredKeyword);
      if (enteredKeyword.toString().trim() == '') {
        foundUsers.value = globalvariables.allUser;
        result.value = foundUsers.value;
      } else {
        foundUsers.value = globalvariables.allUser
            .where((user) => user["name"]
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        result.value = foundUsers.value;
      }
    } else {
      print(enteredKeyword);
      if (enteredKeyword.toString().trim() == '') {
        foundUsers.value = result.value;
      } else {
        foundUsers.value= foundUsers
            .where((user) => user["name"]
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    }
    print(result);
   
  }
}
