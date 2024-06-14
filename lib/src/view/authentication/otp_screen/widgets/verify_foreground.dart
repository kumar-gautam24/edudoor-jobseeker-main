import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/constants/assets_path.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/view/authentication/common_views/send_otp_button.dart';
import 'package:edudoor_jobseeker/src/view/authentication/otp_screen/widgets/otp_info_widget.dart';
import 'package:edudoor_jobseeker/src/view/authentication/otp_screen/widgets/otp_input_field.dart';
import 'package:edudoor_jobseeker/src/view/authentication/otp_screen/widgets/resend_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class VerifyForeground extends StatelessWidget {
  VerifyForeground({super.key});
  final TextEditingController otpController = TextEditingController();

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
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 3.h),
            Text(
              "enter_otp".tr,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "otp_sent".tr,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(.5) ?? Theme.of(context).primaryColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 1.5.h),
                  const _CategorySelector(),
                  SizedBox(height: 1.5.h),
                  const Center(
                    child: OtpInputField(),
                  ),
                  const ResendOtpWidget(),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return SendOtpButton(
                        isWhatsapp: false,
                        onTap: () {
                          if (state is AuthenticationSuccessOTPState) {
                            context.read<AuthenticationBloc>().add(AuthenticationVerifyOtpEvent(phone: state.phone, isWhatsapp: state.isWhatsapp, hash: state.hash));
                          }
                        },
                        color: colorPurpleLight.withOpacity(.3),
                        child: Text(
                          'verify_otp'.tr,
                          style: TextStyle(
                            color: colorPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
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
          width: 1,
        ),
        color: colorIndigoLight.withOpacity(.3),
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: const Center(child: OtpInfoWidget()),
    );
  }
}
