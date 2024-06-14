import 'package:edudoor_jobseeker/src/constants/assets_path.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/themes/font_family.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  final bool isShowText;
  const LoadingScreen({super.key, this.isShowText = true});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: isShowText ? 70.w : 50.w,
              height: isShowText ? 70.w : 50.w,
              child: Lottie.asset(AssetsPath.CAT_SLEEPING),
            ),
            isShowText
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Load',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.dancing,
                            color: colorBlue,
                          ),
                        ),
                        TextSpan(
                          text: 'ing',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.dancing,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
