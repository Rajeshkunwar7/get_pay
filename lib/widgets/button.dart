import 'package:flutter/material.dart';

import '../component/colors.dart';

class AppBtn extends StatelessWidget {
  final double? fontSize;
  final IconData icon;
  final Function()? onTap;
  final Color? bgColor;
  final Color? iconColor;
  final Color? txtColor;
  final String? txt;

  const AppBtn({
    super.key,
    this.fontSize = 20,
    required this.icon,
    this.txt,
    this.onTap,
    this.bgColor = AppColor.mainColor,
    this.iconColor = Colors.white,
    this.txtColor = AppColor.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: bgColor,
            ),
            child: Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
          ),
          if (txt != null)
            Text(
              txt!,
              style: TextStyle(
                fontSize: 14,
                color: txtColor,
              ),
            )
        ],
      ),
    );
  }
}
