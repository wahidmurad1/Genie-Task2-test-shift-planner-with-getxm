import 'package:flutter/material.dart';
import 'package:genie_task/controller/radio_button_controller.dart';
import 'package:get/get.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({Key? key}) : super(key: key);

  RadioButtonController radioButtonController =
      Get.put(RadioButtonController());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          radioButtonController.titleText2(),
          // Text(
          //   widget.titleText,
          //   style: TextStyle(
          //       fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              radioButtonController.selectedText2(),
              // Text(
              //   widget.selectedText,
              //   style: TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500,
              //       color: Colors.black),
              // ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width - 48,
            child: Divider(
              //height: 0.3,
              thickness: 0.3,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
