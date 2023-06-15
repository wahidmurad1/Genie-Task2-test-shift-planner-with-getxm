import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:genie_task/const2/custom_time_picker.dart';
import 'package:genie_task/const2/datepicker2.dart';
import 'package:genie_task/controller/date_picker_controller.dart';
import 'package:genie_task/controller/date_time_controller.dart';
import 'package:genie_task/controller/time_picker_controller.dart';
import 'package:get/get.dart';

class FilterPopup {
  DatePickerController datePickerController = Get.put(DatePickerController());
  TimePickerController timePickerController = Get.put(TimePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  filterPopup1(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              height: 440,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 8),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // const SizedBox(
                        //   width: 8,
                        // ),
                        TextButton(
                          style:
                              TextButton.styleFrom(padding: EdgeInsets.all(0)),
                          onPressed: () {
                            // Get.back();
                            datePickerController.dateortimepicker.value = "";
                            datePickerController.dateortimepicker2.value = "";
                            dateTimeHandler.startTime.value = "";
                            dateTimeHandler.endTime.value = "";
                            globalvariables.options.clear();
                            //datePickerController.selectedDate = DateTime.now();
                            datePickerController.selectedStartDate.value =
                                DateTime.now();
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFFFF6368)),
                          ),
                        ),

                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.back();
                            datePickerController.dateortimepicker.value = "";
                            datePickerController.dateortimepicker2.value = "";
                            dateTimeHandler.startTime.value = "";
                            dateTimeHandler.endTime.value = "";
                          },
                          icon: Icon(
                            Icons.close,
                            size: 16,
                            color: Color(0XFF0E1826),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: DatePicker2(
                          isInitialDateTime: true,
                          titleText: 'Start Date',
                        ),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: DatePicker2(
                          isInitialDateTime: false,
                          titleText: 'End Date',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: CustomTimePicker(
                            boxTextString: 'Start Time',
                            timePicker: dateTimeHandler.startTime),
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: CustomTimePicker(
                          boxTextString: 'End Time',
                          timePicker: dateTimeHandler.endTime,
                          // titleText: 'End Time',
                          // isInitialDateTime: false,
                        ),
                      ),
                    ],
                  ),
                  // GetBuilder<GlobalVariables>(
                  //     init: GlobalVariables(),
                  //     builder: (globalVariables) {
                  //       return CustomRadioButton(
                  //         titleText: 'Select Car/License Plate',
                  //         selectedText: globalVariables.radioValue1.toString(),
                  //         icon: Icons.arrow_forward_ios,
                  //         onPressed: () {
                  //           filterPopup2(context);
                  //         },
                  //       );
                  //     }),
                  // GetBuilder<GlobalVariables>(
                  //     init: GlobalVariables(),
                  //     builder: (globalVariables) {
                  //       return CustomRadioButton(
                  //         titleText: 'Select Driver',
                  //         selectedText: globalVariables.radioValue2.toString(),
                  //         icon: Icons.arrow_forward_ios,
                  //         onPressed: () {
                  //           filterPopup3(context);
                  //         },
                  //       );
                  //     }),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 20),
                    child: Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0XFFF89818),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          if (datePickerController
                              .dateortimepicker.value.isNotEmpty) {
                            globalvariables.options.add(
                                datePickerController.dateortimepicker.value);
                          }
                          if (datePickerController
                              .dateortimepicker2.isNotEmpty) {
                            globalvariables.options.add(
                                datePickerController.dateortimepicker2.value);
                          }
                          if (dateTimeHandler.startTime.value.isNotEmpty) {
                            globalvariables.options
                                .add(dateTimeHandler.startTime.value);
                          }
                          if (dateTimeHandler.endTime.value.isNotEmpty) {
                            globalvariables.options
                                .add(dateTimeHandler.endTime.value);
                          }
                        },
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    // });
    // });
  }
}
