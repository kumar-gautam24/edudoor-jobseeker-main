import 'package:edudoor_jobseeker/src/constants/assets_path.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/themes/font_family.dart';
import 'package:edudoor_jobseeker/src/view/common/gradients/all_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          gradient: AllGradient.primaryGradient,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsPath.LOGO,
                    width: MediaQuery.sizeOf(context).width * .5,
                  ),
                  SizedBox(height: 16.sp),
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "title".tr,
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.dancing,
                          color: colorWhite,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(height: 16.sp),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(colorWhite),
                  ),
                ],
              ),
            ),
            Text(
              "copy_right".trParams({"year": DateTime.now().year.toString()}),
              // '@${DateTime.now().year} Edudoor copyright',
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
    );
  }
}
