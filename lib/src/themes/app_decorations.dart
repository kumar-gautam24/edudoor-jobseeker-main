import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  final BoxDecoration decoration;
  final InputDecoration inputDecoration;
  AppDecoration({this.decoration = const BoxDecoration(), this.inputDecoration = const InputDecoration()});
  factory AppDecoration.containerOnlyShadowTop(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          color: colorBlack,
          boxShadow: [
            BoxShadow(
              color: colorBlack.withOpacity(.65),
              offset: const Offset(-2, -2),
              blurRadius: 10,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          color: colorGreyLighter,
          boxShadow: [
            BoxShadow(
              color: colorWhite,
              offset: const Offset(-2, -2),
              blurRadius: 10,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.buttonActionCircle(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorBlack,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.8),
              offset: const Offset(1, 1),
              blurRadius: 1,
            ),
            BoxShadow(
              color: colorBlack.withOpacity(.35),
              offset: const Offset(-1, -1),
              blurRadius: 1,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorGreyLighter,
          boxShadow: [
            BoxShadow(
              color: colorBlack.withOpacity(0.075),
              offset: const Offset(1, 1),
              blurRadius: 1,
            ),
            BoxShadow(
              color: colorWhite,
              offset: const Offset(-1, -1),
              blurRadius: 1,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.buttonActionCircleActive(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(.4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade900,
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: -2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorBlack.withOpacity(0.075),
          boxShadow: [
            BoxShadow(
              color: colorWhite,
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: -2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.buttonActionBorderActive(context, radius) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.black.withOpacity(.4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade900,
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: -2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: colorBlack.withOpacity(0.075),
          boxShadow: [
            BoxShadow(
              color: colorWhite,
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: -2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.buttonActionCircleCall(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorBlack,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.8),
              offset: const Offset(2, 2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: colorBlack.withOpacity(.35),
              offset: const Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorGreyLighter.withOpacity(.1),
          boxShadow: [
            BoxShadow(
              color: colorGreyLight.withOpacity(.3),
              offset: const Offset(.5, .5),
              blurRadius: .5,
            ),
            BoxShadow(
              color: colorWhite.withOpacity(.01),
              offset: const Offset(-1, -1),
              blurRadius: .5,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.buttonActionBorder(context, radius) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: colorBlack,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              offset: const Offset(4, 4),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              offset: const Offset(-1, -1),
              blurRadius: 20,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: colorGreyLighter,
          boxShadow: [
            BoxShadow(
              color: colorBlack.withOpacity(0.075),
              offset: const Offset(5, 5),
              blurRadius: 5,
            ),
            BoxShadow(
              color: colorWhite,
              offset: const Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.tabBarDecoration(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
          decoration: BoxDecoration(
        color: colorBlack.withOpacity(.85),
        boxShadow: [
          BoxShadow(
            color: colorBlack,
            offset: const Offset(-2, -2),
            blurRadius: 2,
          ),
          BoxShadow(
            color: colorBlack.withOpacity(.8),
            offset: const Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ));
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          color: colorWhite,
          boxShadow: [
            BoxShadow(
              color: colorBlack.withOpacity(0.075),
              offset: const Offset(2, 2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: colorGreyLighter,
              offset: const Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.tabBarDecorationSecond(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
          decoration: BoxDecoration(
        color: colorBlack,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.6),
            offset: const Offset(1, 1),
            blurRadius: 1,
          ),
        ],
      ));
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          color: colorGreyLighter,
          boxShadow: [
            BoxShadow(
              color: colorBlack.withOpacity(0.075),
              offset: const Offset(2, 2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.inputChatDecoration(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          color: Colors.black.withOpacity(.25),
          boxShadow: [
            BoxShadow(
              color: colorBlack.withOpacity(.1),
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: -2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          color: colorBlack.withOpacity(0.075),
          boxShadow: [
            BoxShadow(
              color: colorWhite,
              offset: const Offset(2, 2),
              blurRadius: 2,
              spreadRadius: -2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.inputFieldDecoration(context, {Widget? suffix, String? hint, Widget? prefixIcon}) {
    final outLineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.sp),
      borderSide: BorderSide(color: Theme.of(context).primaryColor.withOpacity(.5), width: 2.sp),
    );
    return AppDecoration(
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        hintText: hint,
        hintStyle: TextStyle(color: colorGrey),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: outLineBorder,
        focusedBorder: outLineBorder,
        errorBorder: outLineBorder,
        focusedErrorBorder: outLineBorder,
        suffixIcon: suffix,
        prefixIcon: prefixIcon,
        iconColor:Theme.of(context).primaryColor
      ),
    );
  }
}
