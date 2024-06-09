import 'package:flutter/material.dart';
import 'package:get_pay/component/colors.dart';

class LargeBtn extends StatelessWidget {
  final Color? bgColor;
  final Color? txtColor;
  final Function()? onTap;
  final bool? isBorder;
  final String text;

  const LargeBtn({
    super.key,
    this.bgColor = AppColor.mainColor,
    this.txtColor,
    this.onTap,
    this.isBorder = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        margin: const EdgeInsets.only(left: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: txtColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
