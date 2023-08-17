import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  AppButton(
      {super.key,
      this.isIcon = false,
      this.icon,
      this.text = '',
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == true
          ? Center(child: Icon(icon))
          : Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            ),
    );
  }
}
