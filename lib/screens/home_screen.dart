import 'package:flutter/material.dart';
import 'package:genie_task/const/custom_dialog_box.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:genie_task/const/search_screen.dart';
import 'package:genie_task/screens/available_shift2.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  // final FocusNode focusNode = FocusNode();
  int val = 0;
  bool isIconVisible = false;
  CustomDialogBox customDialogBox = CustomDialogBox();


  bool isSearching = false;
  @override
  void dispose() {
    if (mounted) {
      _searchTextController.dispose();
      // focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              padding: const EdgeInsets.only(left: 10, top: 15),
              child: Row(
                children: [
                  SearchScreen(
                    icon: Icons.close,
                    searchTextController: _searchTextController,
                    isIconVisible: isIconVisible,
                    onPressed: () {
                      isSearching = false;
                      setState(() {
                        _searchTextController.clear();
                        isIconVisible = false;
                        globalvariables.foundUsers = globalvariables.allUser;
                        // globalvariables.isIconVisible = false;
                        //isIconVisible=false;
                      });
                    },
                    onChanged: (v) {
                      globalvariables.runFilter(_searchTextController.text);
                      if (v.toString().trim() == '') {
                        setState(() {
                          isIconVisible = false;
                          // globalvariables.foundUsers = globalvariables.allUser;
                        });
                      } else if (v.isNotEmpty) {
                        setState(() {
                          isIconVisible = true;
                        });
                      } else {
                        setState(() {
                          isIconVisible = false;
                          globalvariables.foundUsers = globalvariables.allUser;
                        });
                      }
                      
                    },
                    onSubmit: (value) {
                      globalvariables.runFilter(_searchTextController.text);
                      globalvariables.addData(value);
                      _searchTextController.clear();
                      isIconVisible = false;

                      if (globalvariables.options.isNotEmpty) {
                        globalvariables.isVisible = true;
                      } else {
                        globalvariables.isVisible = false;
                      }
                      setState(() {
                        // Obx(() => globalvariables.isVisible=false);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      onTap: () {
                        customDialogBox.filterPopup(
                          context,
                          () {
                            Navigator.pop(context);
                            //create date and time custom chip
                            // setState(() {
                            print(globalvariables.startDate.value);
                            print(globalvariables.options);
                            if (globalvariables.startDate.isNotEmpty) {
                              globalvariables.options
                                  .add(globalvariables.startDate.value);
                              globalvariables.isVisible = true;
                            }
                            if (globalvariables.endDate.isNotEmpty) {
                              globalvariables.options
                                  .add(globalvariables.endDate.value);
                              globalvariables.isVisible = true;
                            }
                            if (globalvariables.startTime.isNotEmpty) {
                              globalvariables.options
                                  .add(globalvariables.startTime.value);
                              globalvariables.isVisible = true;
                            }
                            if (globalvariables.endTime.isNotEmpty) {
                              globalvariables.options
                                  .add(globalvariables.endTime.value);
                              globalvariables.isVisible = true;
                            }
                            // globalvariables.startDate.clear;
                            // globalvariables.endDate.refresh();
                            // globalvariables.startTime.refresh();
                            // globalvariables.endTime.refresh();
                            setState(() {
                            });
                          },
                        );
              
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0XFFF89818),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          'assets/images/vector.png',
                          width: 13,
                          height: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Custom Chips
            SizedBox(
              height: 10,
            ),
            if (globalvariables.options.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Visibility(
                  visible: globalvariables.isVisible,
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
                                  // for(var i=1;i<globalvariables.options.length;i++)
                                  Text(
                                    globalvariables.options[i],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          globalvariables.options.removeAt(i);
                                          globalvariables.foundUsers =
                                              globalvariables.allUser;
                                        });
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
                      if (globalvariables.isVisible == true)
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
                                // for(var i=1;i<globalvariables.options.length;i++)
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
                                      setState(() {
                                        globalvariables.options.clear();
                                        globalvariables.foundUsers =
                                            globalvariables.allUser;
                                        // globalvariables.options.removeAt(i);
                                        //globalvariables.isVisible = false;
                                      });
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
                ),
              ),

            
            //chip choice function
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 0),
                  child: Text(
                    'Available Shifts',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )),
            //Available Shifts UI
            // AvailableShift(),
            AvailableShift2(),
          ],
        ),
      ),
    );
  
  }
}


  // if (globalvariables.options.isNotEmpty)
  //             Visibility(
  //               visible: globalvariables.isVisible,
  //               child: Wrap(
  //                 direction: Axis.horizontal,
  //                 children: [
  //                   ChipsChoice<int>.single(
  //                     value: tag,
  //                     onChanged: (val) => setState(() => tag = val),
  //                     choiceItems: C2Choice.listFrom<int, String>(
  //                       source: globalvariables.options,
  //                       value: (i, v) => i,
  //                       label: (i, v) => (v),
  //                       tooltip: (i, v) => v,
  //                       delete: (i, v) => () {
  //                         setState(() => globalvariables.options.removeAt(i));
  //                       },
  //                     ),
  //                     choiceStyle: C2ChipStyle.outlined(
  //                       borderOpacity: 0.3,
  //                       borderStyle: BorderStyle.solid,
  //                       color: Colors.black,
  //                       iconColor: const Color(0xffFF6368),
  //                       iconSize: 22,
  //                       foregroundStyle: const TextStyle(
  //                           fontSize: 16.8,
  //                           fontFamily: 'Euclid',
  //                           color: Colors.black),
  //                       borderRadius: const BorderRadius.all(
  //                         Radius.circular(15),
  //                       ),
  //                     ),
  //                     wrapped: true,
  //                   ),
  //                 ],
  //               ),
  //             ),