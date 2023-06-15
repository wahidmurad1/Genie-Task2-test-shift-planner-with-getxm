import 'package:flutter/material.dart';
import 'package:genie_task/const/custom_date_picker.dart';
import 'package:genie_task/const/custom_radio_button.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:get/get.dart';

class CustomDialogBox {
  int groupValue = 0;
  int groupValue2 = 0;
  filterPopup(context, onPressed) {
    showDialog(
        context: context,
        builder: (context) {
          return GetBuilder<GlobalVariables>(
              init: GlobalVariables(),
              builder: (globalVariables) {
                return Dialog(
                  backgroundColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0)),
                                onPressed: () {
                                  // setState(() {
                                  globalvariables.startDate = "" as RxString;
                                  //  globalvariables.endDate = "" as RxString ;
                                  //  globalvariables.startTime = "";
                                  //  globalvariables.endTime = "";
                                  //globalvariables.radioValue1 = "" as RxString;
                                  //globalvariables.radioValue2 = "";
                                  //globalvariables.options.clear();
                                  //  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFFFF6368)),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
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
                              width:
                                  (MediaQuery.of(context).size.width - 48) / 2,
                              child: CustomDatePicker(
                                boxTextString: 'Start Date',
                                dateortimepicker: globalvariables.startDate,
                                dateortime: "date",
                                icon: Icons.date_range_rounded,
                                isInitialDateTime: true,
                              ),
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 48) / 2,
                              child: CustomDatePicker(
                                boxTextString: 'End Date',
                                dateortimepicker: globalVariables.endDate,
                                dateortime: "date",
                                icon: Icons.date_range_rounded,
                                isInitialDateTime: false,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 48) / 2,
                              child: CustomDatePicker(
                                boxTextString: 'Start Time',
                                dateortimepicker: globalvariables.startTime,
                                dateortime: "time",
                                icon: Icons.access_time_filled_outlined,
                                isInitialDateTime: true,
                              ),
                            ),
                            SizedBox(
                              width:
                                  (MediaQuery.of(context).size.width - 48) / 2,
                              child: CustomDatePicker(
                                boxTextString: 'End Time',
                                dateortimepicker: globalvariables.endTime,
                                dateortime: "time",
                                icon: Icons.access_time_filled_outlined,
                                isInitialDateTime: false,
                              ),
                            ),
                          ],
                        ),
                        GetBuilder<GlobalVariables>(
                            init: GlobalVariables(),
                            builder: (globalVariables) {
                              return CustomRadioButton(
                                titleText: 'Select Car/License Plate',
                                selectedText:
                                    globalVariables.radioValue1.toString(),
                                icon: Icons.arrow_forward_ios,
                                onPressed: () {
                                  filterPopup2(context);
                                },
                              );
                            }),
                        GetBuilder<GlobalVariables>(
                            init: GlobalVariables(),
                            builder: (globalVariables) {
                              return CustomRadioButton(
                                titleText: 'Select Driver',
                                selectedText:
                                    globalVariables.radioValue2.toString(),
                                icon: Icons.arrow_forward_ios,
                                onPressed: () {
                                  filterPopup3(context);
                                },
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 20),
                          child: Container(
                            width: 90,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0XFFF89818),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextButton(
                              onPressed: onPressed,
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
        });
    // });
  }
}

filterPopup2(context) {
  showDialog(
      context: context,
      builder: (context) {
        // return StatefulBuilder(builder: (context, setState) {
        return GetBuilder<GlobalVariables>(
            init: GlobalVariables(),
            builder: (globalVariables) {
              return Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Select Car',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                        Container(
                          width: 312,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Color(0XFFD1D5DB), width: 1)),
                          child: const TextField(
                            style: TextStyle(color: Colors.black),
                            autofocus: true,
                            textInputAction: TextInputAction.search,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Search",
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
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: globalvariables.carNumber.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Text(
                                      globalvariables.carNumber[index],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                    Radio(
                                      value: index + 1,
                                      groupValue: globalvariables.groupValue1,
                                      activeColor: Colors.green,
                                      onChanged: (val) {
                                        print(val);
                                        //setState(() {
                                        globalvariables.groupValue1 =
                                            val as int?;
                                        globalvariables.radioValue1 = RxString(
                                            globalvariables
                                                .carNumber[(val as int) - 1]);
                                        //  });
                                      },
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0XFFF89818),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                globalvariables.radioValue1;
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      });
  //});
}

filterPopup3(context) {
  showDialog(
      context: context,
      builder: (context) {
        // return StatefulBuilder(builder: (context, setState) {
        return GetBuilder<GlobalVariables>(
            init: GlobalVariables(),
            builder: (globalVariables) {
              return Dialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Select Driver',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: globalvariables.driverName.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Text(
                                      globalvariables.driverName[index],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                    Radio(
                                      value: index + 1,
                                      groupValue: globalVariables.groupValue2,
                                      activeColor: Colors.green,
                                      onChanged: (val) {
                                        print(val);
                                        // setState(() {
                                        globalVariables.groupValue2 =
                                            val as int?;
                                        globalVariables.radioValue2 = RxString(
                                            globalVariables
                                                .driverName[(val as int) - 1]);
                                        //  });
                                      },
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0XFFF89818),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                globalVariables.radioValue2;
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      });
  //});
}
