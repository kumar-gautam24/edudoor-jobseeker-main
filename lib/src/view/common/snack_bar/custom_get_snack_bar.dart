import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGetSnackBar {
  final String title;
  final String subTitle;
  final int duration;
  bool? shouldIconPulse;
  Widget? icon;
  TextButton? mainButton;
  bool? isDismissible;
  DismissDirection? dismissDirection;
  OnTap? onTap;
  Color titleColor;
  Color subTitleColor;
  SnackPosition snackPosition;
  Gradient? backgroundGradient;

  CustomGetSnackBar({
    required this.title,
    required this.subTitle,
    this.icon,
    this.shouldIconPulse,
    this.mainButton,
    this.isDismissible,
    this.dismissDirection,
    this.onTap,
    this.titleColor = Colors.black,
    this.subTitleColor = Colors.black,
    this.snackPosition = SnackPosition.TOP,
    this.duration = 5000,
    this.backgroundGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF64B5F6), Color(0xFF42A5F5)],
    ),
  });

  show() {
    Get.snackbar(
      '',
      '',
      onTap: onTap,
      colorText: Colors.blue,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      mainButton: mainButton,
      duration: Duration(
        milliseconds: duration,
      ),
      snackPosition: snackPosition,
      backgroundGradient: backgroundGradient,
      icon: icon,
      shouldIconPulse: shouldIconPulse,
      isDismissible: isDismissible,
      dismissDirection: dismissDirection,
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          color: titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        subTitle,
        style: TextStyle(
          fontSize: 10.5.sp,
          color: subTitleColor.withOpacity(0.75),
          fontWeight: FontWeight.w400,
        ),
      ),
      margin: EdgeInsets.fromLTRB(
        16.sp,
        16.sp,
        16.sp,
        16.sp,
      ),
      padding: EdgeInsets.fromLTRB(
        16.sp,
        16.sp,
        6.sp,
        14.sp,
      ),
    );
  }
}
