import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_ui/Utils/common/constants.dart';
import 'package:fluuter_ui/Utils/common/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double width;

  const OptionButton(
      {super.key,
      required this.text,
      required this.iconData,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            backgroundColor: MaterialStateProperty.all<Color>(COLOR_DARK_BLUE),
          ),

          child: Row(
            children: [

              Icon(iconData , color: COLOR_WHITE,),
              addHorizontalSpace(10),
              Text(text , style: const TextStyle(color: COLOR_WHITE),)

            ],
          )),
    );
  }
}
