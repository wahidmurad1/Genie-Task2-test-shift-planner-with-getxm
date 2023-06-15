import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButtonController extends GetxController {
  RxString titleText = RxString("");
  RxString selectedText = RxString("");
  RxInt groupValue = 0.obs;
  RxInt groupValue2 = 0.obs;
  titleText2() {
    if (selectedText.value == "") {
      return const SizedBox(height: 14);
    } else {
      //widget.boxTextString = widget.dateortimepicker;
      return SizedBox(
        height: 14,
        child: Text(titleText.value,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  selectedText2() {
    if (selectedText == "") {
      return Text(titleText.value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    } else {
      return Text(
        selectedText.value,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
          //fontWeight: FontWeight.w500
        ),
      );
    }
  }
}
