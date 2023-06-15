import 'package:flutter/material.dart';
import 'package:genie_task/const/custom_radio_button.dart';
import 'package:genie_task/const2/custom_chips.dart';
import 'package:genie_task/const2/filter_popup.dart';
import 'package:genie_task/const2/search_screen2.dart';
import 'package:genie_task/controller/listView_controller.dart';
import 'package:genie_task/controller/login_controller.dart';
import 'package:genie_task/controller/search_controller.dart';
import 'package:genie_task/screens2/available_shift.dart';
import 'package:get/get.dart';

class HomeScreen2 extends StatelessWidget {
  HomeScreen2({Key? key}) : super(key: key);

  SearchController searchController = Get.put(SearchController());
  ListViewController listViewController = Get.put(ListViewController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 32),
              child: Text(
                'Shift Planner',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 15, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Search Screen
                SearchScreen2(),
                //pop up
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0XFFF89818),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextButton(
                    onPressed: () {
                      //FilterPopup().filterPopup1(context, () {});
                      FilterPopup().filterPopup1(context);
                    },
                    child: Image.asset('assets/images/vector.png'),
                  ),
                ),
              ],
            ),
          ),
          // Custom chip
          const SizedBox(
            height: 10,
          ),
          CustomChips(),

          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: Text(
                  'Available Shifts',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              )),
          //ListView Show
          AvailableShift(),
        ],
      ),
    ));
  }
}
