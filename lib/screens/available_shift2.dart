import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:intl/intl.dart';

class AvailableShift2 extends StatefulWidget {
  const AvailableShift2({Key? key}) : super(key: key);

  @override
  State<AvailableShift2> createState() => _AvailableShift2State();
}

class _AvailableShift2State extends State<AvailableShift2> {
  @override
  void initState() {
    globalvariables.foundUsers = globalvariables.allUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ListView.builder(
          itemCount: globalvariables.foundUsers.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                  .copyWith(bottom: 0),
              child: Column(
                children: [
                  Container(
                    height: 74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0XFF2257AA),
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 7),
                          child: Image.asset(
                            globalvariables.foundUsers[index]["image"],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    globalvariables.foundUsers[index]["name"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    globalvariables.foundUsers[index]["number"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    globalvariables.foundUsers[index]["time"]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 61,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0XFFF89818),
                                borderRadius: BorderRadius.circular(4).copyWith(
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  
  }
}

// void showCustomDialog(BuildContext context) {
//   int groupValue = 0;
//   int groupValue2 = 0;

//   var start='';
//   var end='';
//   DateTime _dateTime = DateTime.now();
//   DateTime _dateTime2 = DateTime.now();

//   void _showDatePicker() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020, 01, 01),
//       lastDate: DateTime(2040, 12, 31),
//     );
//   }

//   void _showDatePicker2() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020, 01, 01),
//       lastDate: DateTime(2035, 12, 31),
//     );
//   }

//   // @override
//   // void initState() {
//   //   start = DateFormat('yyyy/MM/dd').format(_dateTime);
//   //   end = DateFormat('yyyy/MM/dd').format(_dateTime);
//   //   super.initState();
//   // }

//   showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Container(
//             height: 300,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(0),
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       const Text(
//                         "Filter",
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const Text(
//                         "Clear",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0XFFFF6368),
//                         ),
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.close,
//                           size: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                  const SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Start Date',
//                                         style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       )),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         start,
//                                         style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       const SizedBox(
//                                         width: 30,
//                                       ),
//                                       InkWell(
//                                         onTap: _showDatePicker,
//                                         child: Icon(
//                                           Icons.date_range_rounded,
//                                           size: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 4),
//                                     child: Container(
//                                       width: 135,
//                                       height: 1,
//                                       color: Color(0XFFD1D5DB),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Align(
//                                       alignment: Alignment.topRight,
//                                       child: Text(
//                                         'End Date',
//                                         style: TextStyle(
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       )),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         end,
//                                         style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       const SizedBox(
//                                         width: 30,
//                                       ),
//                                       InkWell(
//                                         onTap: _showDatePicker2,
//                                         child: Icon(
//                                           Icons.date_range_rounded,
//                                           size: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 4),
//                                     child: Container(
//                                       width: 135,
//                                       height: 1,
//                                       color: Color(0XFFD1D5DB),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 16),
//                             child: Row(
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text(
//                                           'Start Time',
//                                           style: TextStyle(
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         )),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           '10:00',
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w400),
//                                         ),
//                                         const SizedBox(
//                                           width: 85,
//                                         ),
//                                         Icon(
//                                           Icons.watch_later_rounded,
//                                           size: 16,
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 4),
//                                       child: Container(
//                                         width: 135,
//                                         height: 1,
//                                         color: Color(0XFFD1D5DB),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text(
//                                           'End Time',
//                                           style: TextStyle(
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         )),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           '18:00',
//                                           style: TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w400),
//                                         ),
//                                         const SizedBox(
//                                           width: 80,
//                                         ),
//                                         Icon(
//                                           Icons.watch_later_rounded,
//                                           size: 16,
//                                         ),
//                                       ],
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 4),
//                                       child: Container(
//                                         width: 135,
//                                         height: 1,
//                                         color: Color(0XFFD1D5DB),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
                         
//               ],
//             ),
//           ),
//         );
//       });
// }
