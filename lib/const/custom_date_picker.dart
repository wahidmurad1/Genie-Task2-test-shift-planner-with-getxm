import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:genie_task/const/global_variable.dart';
import 'package:get/get.dart';
import 'package:genie_task/const/global_variable.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({
    Key? key,
    required this.boxTextString,
    required this.dateortimepicker,
    required this.dateortime,
    required this.icon,
    required this.isInitialDateTime,
  }) : super(key: key);

  var boxTextString;
  RxString dateortimepicker;
  var dateortime;
  IconData icon;
  bool isInitialDateTime;
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        if (widget.isInitialDateTime==true) {
          if (widget.dateortime == "date") {
            DateTime? pickStartDate = await showDatePicker(
                context: context,
                initialDate: globalvariables.selectedStartDate.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101));
            if (pickStartDate != null) {
              setState(() {
                selectedDate = pickStartDate;
               globalvariables.selectedStartDate.value = pickStartDate;
               //globalvariables.selectedEndDate.value =  globalvariables.selectedStartDate.value;
                widget.dateortimepicker.value =
                    formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
                //globalvariables.selectedEndDate.value = pickStartDate;
              });
            }
          }
        } 
        if (widget.isInitialDateTime == false) {
          if (widget.dateortime == "date") {
            DateTime? pickEndDate = await showDatePicker(
                context: context,
                initialDate: globalvariables.selectedStartDate.value.isAfter(globalvariables.selectedEndDate.value)?globalvariables.selectedStartDate.value:globalvariables.selectedEndDate.value,
                firstDate: globalvariables.selectedStartDate.value,
                lastDate: DateTime(2101));
           // if (pickEndDate.isAfter(globalvariables.selectedStartDate.value)) {
              setState(() {
                if(pickEndDate!.isAfter(globalvariables.selectedStartDate.value)){
                  globalvariables.selectedEndDate.value=pickEndDate;
                };
                // globalvariables.selectedEndDate.value = pickEndDate;
                // print(globalvariables.selectedEndDate.value);
               // globalvariables.selectedStartDate.value = pickStartDate;
               //globalvariables.selectedEndDate2.value = globalvariables.selectedEndDate.value;
               widget.dateortimepicker.value =
                   formatDate(pickEndDate, [dd, ".", " ", MM, " ", yyyy]);
              });
            }
          }
       // } 
        if(globalvariables.selectedEndDate.value.isAfter(globalvariables.selectedStartDate.value)){
          print("Start data is greater than end data");
          // setState(() {
            //globalvariables.selectedEndDate.value="" as DateTime;
            widget.dateortimepicker="" as RxString;
          //});
          
        }
        // else if(globalvariables.selectedStartDate.value.isAfter(globalvariables.selectedEndDate.value)){
        //   setState(() {
           
        //   });
        // }
        if (widget.dateortime == "time") {
          TimeOfDay? pickTime = await showTimePicker(
              context: context,
              initialTime: globalvariables.selectedStartTime ??
                  selectedTime ??
                  TimeOfDay(hour: 12, minute: 00));
          if (pickTime != null) {
            setState(() {
              selectedTime = pickTime;
              if (widget.isInitialDateTime) {
                globalvariables.selectedStartTime = pickTime;
              }
              widget.dateortimepicker.value =
                  '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
              // globalvariables.addData(widget.dateortimepicker);
            });
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              boxText(),
              Icon(
                widget.icon,
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
      ),
    );
  }

  labelText() {
    if (widget.dateortimepicker == "") {
      return const SizedBox(height: 14);
    } else {
      //widget.boxTextString = widget.dateortimepicker;
      return SizedBox(
        height: 14,
        child: Text(widget.boxTextString,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  boxText() {
    if (widget.dateortimepicker == "") {
      return Text(widget.boxTextString,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    } else {
      return Text(
        widget.dateortimepicker.value,
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
