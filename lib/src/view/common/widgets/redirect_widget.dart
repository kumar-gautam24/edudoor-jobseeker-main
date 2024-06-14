import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/redirect_bloc/redirect_bloc.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectWidget extends StatelessWidget {
  const RedirectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 100,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
        child: Container(
          width: 90.w,
          height: 140.sp,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 100.sp, blurStyle: BlurStyle.outer),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20.sp),
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "complete_profile".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  Text(
                    "hr_considers".tr,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: colorGreyLight,
                    ),
                  ),
                ],
              ),
              const Stack(
                children: [
                  _AnimatedContainerForAnimation(),
                  _AnimatedContainerText(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedContainerText extends StatelessWidget {
  const _AnimatedContainerText();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: 80.w,
      height: 40.sp,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColorDark, width: 2.sp),
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(16.sp),
        ),
      ),
      child: Text('complete_your_profile'.tr),
    );
  }
}

class _AnimatedContainerForAnimation extends StatelessWidget {
  const _AnimatedContainerForAnimation();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      width: 80.w,
      alignment: AlignmentDirectional.centerStart,
      child: TweenAnimationBuilder<double>(
        curve: Curves.easeInToLinear,
        onEnd: () {
          AllBloc.redirectBloc.add(RedirectHideEvent());
        },
        tween: Tween<double>(begin: 20, end: MediaQuery.of(context).size.width * 0.8),
        duration: const Duration(seconds: 4),
        builder: (context, value, child) => ClipRect(
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            width: value,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 2),
              color: Colors.blue,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
