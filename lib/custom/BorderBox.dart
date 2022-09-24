import 'package:flutter/cupertino.dart';
import 'package:fluuter_ui/Utils/common/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const BorderBox(
      {super.key, required this.padding,
      required this.width,
      required this.height,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: COLOR_WHITE,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: COLOR_GREY.withAlpha(20), width: .5)),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(
        child: child,
      ),
    );
  }
}
