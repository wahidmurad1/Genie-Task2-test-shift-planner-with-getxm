import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CustomRadioButton extends StatefulWidget {
  final String titleText;
  final String selectedText;
  final IconData icon;
  final VoidCallback onPressed;
  const CustomRadioButton(
      {Key? key,
      required this.titleText,
      required this.selectedText,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleText(),
          // Text(
          //   widget.titleText,
          //   style: TextStyle(
          //       fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedText(),
              // Text(
              //   widget.selectedText,
              //   style: TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500,
              //       color: Colors.black),
              // ),
              Icon(
                widget.icon,
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

  titleText() {
    if (widget.selectedText == "") {
      return const SizedBox(height: 14);
    } else {
      //widget.boxTextString = widget.dateortimepicker;
      return SizedBox(
        height: 14,
        child: Text(widget.titleText,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Euclid',
                color: Colors.grey,
                fontWeight: FontWeight.w500)),
      );
    }
  }

  selectedText() {
    if (widget.selectedText == "") {
      return Text(widget.titleText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ));
    } else {
      return Text(
        widget.selectedText,
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
