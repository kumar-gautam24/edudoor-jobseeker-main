import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:flutter/material.dart';

Future dialogAnimationWrapper(
    {required context,
    required barrierLabel,
    SlideMode slideMode = SlideMode.left,
    Widget? child,
    int duration = 400,
    double paddingTop = 0.0,
    double paddingBottom = 0.0,
    double paddingHorizontal = 15.0,
    bool dismissible = true,
    double borderRadius = 25.0,
    Color? barrierColor,
    bool isTransparent = false,
    double maxWidth = 320.0}) {
  var beginOffset = const Offset(-1, 0);
  switch (slideMode) {
    case SlideMode.left:
      beginOffset = const Offset(-1, 0);
      break;
    case SlideMode.right:
      beginOffset = const Offset(1, 0);
      break;
    case SlideMode.top:
      beginOffset = const Offset(0, -1);
      break;
    case SlideMode.bottom:
      beginOffset = const Offset(0, 1);
      break;
    default:
      beginOffset = const Offset(0, 0);
  }
  return showGeneralDialog(
    barrierLabel: barrierLabel ?? "Barrier",
    barrierDismissible: dismissible,
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: duration),
    context: context,
    pageBuilder: (_, __, ___) {
      return Dialog(
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        insetPadding: EdgeInsets.only(left: paddingHorizontal, right: paddingHorizontal, top: paddingTop, bottom: paddingBottom),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 320),
          child: child,
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: beginOffset, end: const Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}

Future dialogAnimationAlertWrapper({
  required context,
  required barrierLabel,
  SlideMode slideMode = SlideMode.left,
  required Widget alertDialog,
  Widget? child,
  int duration = 400,
  double paddingTop = 0.0,
  double paddingBottom = 0.0,
  double paddingHorizontal = 15.0,
  bool dismissible = true,
  double borderRadius = 25.0,
  Color? barrierColor,
  double maxWidth = 320.0,
}) {
  var beginOffset = const Offset(-1, 0);
  switch (slideMode) {
    case SlideMode.left:
      beginOffset = const Offset(-1, 0);
      break;
    case SlideMode.right:
      beginOffset = const Offset(1, 0);
      break;
    case SlideMode.top:
      beginOffset = const Offset(0, -1);
      break;
    case SlideMode.bottom:
      beginOffset = const Offset(0, 1);
      break;
    default:
      beginOffset = const Offset(0, 0);
  }
  return showGeneralDialog(
    barrierLabel: barrierLabel ?? "Barrier",
    barrierDismissible: dismissible,
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: duration),
    context: context,
    pageBuilder: (_, __, ___) {
      return alertDialog;
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: beginOffset, end: const Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}

showDialogLoading(context) {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    },
    barrierColor: const Color(0x80000000),
    barrierDismissible: false,
  );
}
