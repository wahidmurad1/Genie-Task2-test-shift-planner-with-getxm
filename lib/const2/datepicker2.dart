import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:genie_task/controller/date_picker_controller.dart';
import 'package:get/get.dart';

class DatePicker2 extends StatelessWidget {
  DatePicker2({
    Key? key,
    required this.isInitialDateTime,
    required this.titleText,
  }) : super(key: key);
  final bool isInitialDateTime;
  final String titleText;

  DatePickerController datePickerController = Get.put(DatePickerController());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        if (isInitialDateTime == true) {
          DateTime? pickStartDate = await showDatePicker(
              context: context,
              initialDate: datePickerController.selectedStartDate.value,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));
          if (pickStartDate != null) {
            datePickerController.selectedDate = pickStartDate;
            datePickerController.selectedStartDate.value = pickStartDate;
            //globalvariables.selectedEndDate.value =  globalvariables.selectedStartDate.value;
            datePickerController.dateortimepicker.value =
                formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
            //globalvariables.selectedEndDate.value = pickStartDate;
          }
        }
        //end
        if (isInitialDateTime == false) {
          DateTime? pickEndDate = await showDatePicker(
              context: context,
              initialDate: datePickerController.selectedStartDate.value
                      .isAfter(datePickerController.selectedEndDate.value)
                  ? datePickerController.selectedStartDate.value
                  : datePickerController.selectedEndDate.value,
              firstDate: datePickerController.selectedStartDate.value,
              lastDate: DateTime(2101));
          // if (pickEndDate.isAfter(globalvariables.selectedStartDate.value)) {

          if (pickEndDate!
              .isAfter(datePickerController.selectedStartDate.value)) {
            datePickerController.selectedEndDate.value = pickEndDate;
          }
          ;
          // globalvariables.selectedEndDate.value = pickEndDate;
          // print(globalvariables.selectedEndDate.value);
          // globalvariables.selectedStartDate.value = pickStartDate;
          //globalvariables.selectedEndDate2.value = globalvariables.selectedEndDate.value;
          datePickerController.dateortimepicker2.value =
              formatDate(pickEndDate, [dd, ".", " ", MM, " ", yyyy]);
        }
        // }
        if (datePickerController.selectedEndDate.value
            .isAfter(datePickerController.selectedStartDate.value)) {
          print("End date is greater than start date");
          // setState(() {
          //globalvariables.selectedEndDate.value="" as DateTime;
          // datePickerController.dateortimepicker.value = "";
          //});
        }

        // else if(globalvariables.selectedStartDate.value.isAfter(globalvariables.selectedEndDate.value)){
        //   setState(() {

        //   });
        // }
      },
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText2(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedText2(),
                  Icon(
                    Icons.calendar_month,
                    color: Color(0xff7488A6),
                  )
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                child: Divider(
                  // height: 0.3,
                  thickness: 0.3,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }

  titleText2() {
    if (datePickerController.selectedText == "") {
      return const SizedBox(height: 14);
    } else {
      //widget.boxTextString = widget.dateortimepicker;
      return SizedBox(
        height: 14,
        child: Text(titleText,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  selectedText2() {
    if (datePickerController.dateortimepicker == "" &&
        isInitialDateTime == true) {
      return Text(
        titleText,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
          //fontWeight: FontWeight.w500
        ),
      );
    } else if (isInitialDateTime == true) {
      return Text(
        datePickerController.dateortimepicker.value,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
          //fontWeight: FontWeight.w500
        ),
      );
    }
    if (datePickerController.dateortimepicker2 == "" &&
        isInitialDateTime == false) {
      return Text(
        titleText,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
          //fontWeight: FontWeight.w500
        ),
      );
    } else if (datePickerController.selectedEndDate.value
        .isBefore(datePickerController.selectedStartDate.value)) {
      return Text(
        titleText,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
          //fontWeight: FontWeight.w500
        ),
      );
    } else if (isInitialDateTime == false) {
      return Text(
        datePickerController.dateortimepicker2.value,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
        ),
      );
    }
  }
}
