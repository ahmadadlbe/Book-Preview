import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.backgroundColor,
      required this.onPressed,
      this.borderRadiusGeometry});
  final String text;
  final TextStyle textStyle;
  final void Function() onPressed;
  final Color backgroundColor;
  final BorderRadiusGeometry? borderRadiusGeometry;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadiusGeometry ?? BorderRadius.zero)),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
