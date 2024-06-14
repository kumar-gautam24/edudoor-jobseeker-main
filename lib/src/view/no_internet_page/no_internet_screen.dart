import 'package:edudoor_jobseeker/src/constants/assets_path.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/themes/font_family.dart';
import 'package:edudoor_jobseeker/src/view/common/gradients/all_gradient.dart';
import 'package:edudoor_jobseeker/src/view/common/snack_bar/custom_get_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  void onPopInvoked(didPop) {
    if (didPop == false) {
      CustomGetSnackBar(
        title: "internet_disconnected".tr,
        subTitle: "internet_disconnected_message".tr,
        backgroundGradient: AllGradient.errorGradient,
        titleColor: colorWhite,
        subTitleColor: colorWhite,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: onPopInvoked,
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            gradient: AllGradient.secondaryGradient,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.w,
                      width: 60.w,
                      child: Lottie.asset(AssetsPath.NO_INTERNET_ANIMATION, fit: BoxFit.cover),
                    ),
                    SizedBox(height: 16.sp),
                    Column(
                      children: [
                        Text(
                          "internet_disconnected".tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "internet_disconnected_message".tr,
                          style: TextStyle(
                            fontSize: 10.5.sp,
                            color: colorWhite.withOpacity(0.75),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Text(
                "copy_right".trParams({"year": DateTime.now().year.toString()}),
                style: TextStyle(
                  fontSize: 7.sp,
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 12.sp),
            ],
          ),
        ),
      ),
    );
  }
}
