import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:genie_task/controller/date_picker_controller.dart';
import 'package:genie_task/controller/date_time_controller.dart';
import 'package:genie_task/controller/listView_controller.dart';
import 'package:get/get.dart';

class CustomChips extends StatelessWidget {
  CustomChips({Key? key}) : super(key: key);

  ListViewController listViewController = Get.put(ListViewController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => globalvariables.options.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  for (var i = 0; i < globalvariables.options.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 12),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Color(0XFFD1D5DB))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                globalvariables.options[i],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    globalvariables.options.removeAt(i);
                                    if (globalvariables.options.isEmpty) {
                                      listViewController.foundUsers.value =
                                          globalvariables.allUser;
                                    } else if (globalvariables
                                        .options.isNotEmpty) {
                                      listViewController.foundUsers.value =
                                          listViewController.foundUsers.value;
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.close,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  //if (globalvariables.isVisible == true)
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Color(0XFFD1D5DB))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Clear',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: InkWell(
                              onTap: () {
                                globalvariables.options.clear();
                                listViewController.foundUsers.value =
                                    globalvariables.allUser;
                                datePickerController.dateortimepicker.value =
                                    "";
                                datePickerController.dateortimepicker2.value =
                                    "";
                                dateTimeHandler.startTime.value = "";
                                dateTimeHandler.endTime.value = "";
                                // SearchController.searchTextController.clear();
                                // globalvariables.options.removeAt(i);
                                //globalvariables.isVisible = false;
                              },
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.close,
                                  size: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(),
    );
  }
}
