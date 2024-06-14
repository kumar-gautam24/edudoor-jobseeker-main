import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/constants/assets_path.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/view/authentication/login_screen/widgets/mobile_number_input_box.dart';
import 'package:edudoor_jobseeker/src/view/authentication/common_views/send_otp_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginForeground extends StatelessWidget {
  const LoginForeground({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12.h),
            Image.asset(
              AssetsPath.BANNER,
              height: 15.h,
              color: Theme.of(context).primaryColorDark,
            ),
            SizedBox(height: 3.h),
            Text(
              'login_sign_up'.tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 3.h),
                  const _CategorySelector(),
                  SizedBox(height: 1.5.h),
                  const MobileNumber(),
                  SizedBox(height: 4.h),
                  SendOtpButton(
                    isWhatsapp: false,
                    onTap: () {
                      context.read<AuthenticationBloc>().add(AuthenticationSendOtpEvent(isWhatsapp: false));
                    },
                    color: Theme.of(context).colorScheme.secondary.withOpacity(.3),
                    child: Text(
                      'get_otp'.tr,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  const _SignInWithText(),
                  SizedBox(height: 1.h),
                  SendOtpButton(
                    isWhatsapp: true,
                    onTap: () {
                      context.read<AuthenticationBloc>().add(AuthenticationSendOtpEvent(isWhatsapp: true));
                    },
                    color: colorGreen.withOpacity(.8),
                    child: Image.asset(
                      AssetsPath.WHATSAPP_ICON,
                      height: 5.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 45.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: colorIndigoLight.withOpacity(.3),
          width: 1.sp,
        ),
        color: colorIndigoLight.withOpacity(.3),
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Center(
        child: Text(
          "job_seeker".tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _SignInWithText extends StatelessWidget {
  const _SignInWithText();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      alignment: Alignment.center,
      child: Text(
        "sign_in_with".tr,
        style: TextStyle(
          color: colorGrey,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
