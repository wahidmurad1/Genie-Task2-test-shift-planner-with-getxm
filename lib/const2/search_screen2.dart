import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:genie_task/controller/listView_controller.dart';
import 'package:genie_task/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchScreen2 extends StatelessWidget {
  SearchScreen2({Key? key}) : super(key: key);
  SearchController searchController = Get.put(SearchController());
  ListViewController listViewController = Get.put(ListViewController());

  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: Container(
        width: 305,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0XFFD1D5DB)),
        ),
        child: Obx(
          () => TextField(
            controller: searchTextController,
            onSubmitted: (value) {
              globalvariables.addData(value);
              // globalvariables.isVisible = true;
              // listViewController.runFilter(searchTextController.text);
              searchController.isIconVisible.value = false;
              if (globalvariables.options.isNotEmpty) {
                // globalvariables.isVisible = true;
                //searchController.isIconVisible.value = true;
                listViewController.runFilter(value);
                searchTextController.clear();
                print("Value not empty");
              } else {
                //globalvariables.isVisible = false;
                // globalvariables.foundUsers = globalvariables.allUser;
                //listViewController.runFilter(value);
                listViewController.foundUsers.value = globalvariables.allUser;
                print("Value empty");

                //listViewController.runFilter(value);
              }
            },
            onChanged: (v) {
              //globalvariables.runFilter(searchTextController.text);
              if (v.toString().trim() == '') {
                searchController.isIconVisible.value = false;
                listViewController.runFilter(v);
                // globalvariables.foundUsers = globalvariables.allUser;
              } else if (v.isNotEmpty) {
                // print("Not empty here");
                listViewController.runFilter(v);
                searchController.isIconVisible.value = true;
              } else {
                listViewController.runFilter(v);
                searchController.isIconVisible.value = false;
                //listViewController.foundUsers.value = globalvariables.allUser;
              }
            },
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Search',
              contentPadding: EdgeInsets.fromLTRB(
                12,
                6,
                10,
                12,
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                size: 18,
              ),
              suffixIcon: !searchController.isIconVisible.value
                  ? null
                  : IconButton(
                      onPressed: () {
                        searchTextController.clear();
                        searchController.isIconVisible.value = false;
                        if (globalvariables.options.isNotEmpty) {
                          listViewController.foundUsers.value =
                              listViewController.foundUsers.value;
                        } else {
                          listViewController.foundUsers.value =
                              globalvariables.allUser;
                        }
                      },
                      icon: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
