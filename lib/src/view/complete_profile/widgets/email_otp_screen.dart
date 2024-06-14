import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pinput/pinput.dart';

class EmailOtpScreen extends StatelessWidget {
  final String email;
  EmailOtpScreen({super.key, required this.email});

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: colorBlue),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final isVerified = context.watch<AuthenticationBloc>().jobseekerModel?.isEmailVerified == true && email == context.watch<AuthenticationBloc>().jobseekerModel?.email;
        return isVerified
            ? Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 50.sp,
                      bottom: 16.sp,
                      left: 16.sp,
                      right: 16.sp,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    margin: EdgeInsets.only(top: 40.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'verified'.tr,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'email_verified'.trParams({'email': email}),
                          textAlign: TextAlign.center,
                        ),
                        Gap(30.sp),
                        TextButton(
                            onPressed: () {
                              AppNavigator.pop();
                            },
                            child: Text('ok'.tr))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 16,
                    right: 16,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 100.sp,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        Icon(
                          PhosphorIcons.sealCheck(PhosphorIconsStyle.fill),
                          size: 75.sp,
                          color: colorGreen,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 50.sp,
                      bottom: 16.sp,
                      left: 16.sp,
                      right: 16.sp,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    margin: EdgeInsets.only(top: 40.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'enter_otp'.tr,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                            'email_send_to'.trParams(
                              {'email': email},
                            ),
                            textAlign: TextAlign.center),
                        Gap(20.sp),
                        Pinput(
                            controller: context.read<AuthenticationBloc>().emailOtpController,
                            defaultPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: colorBlue),
                              ),
                            )),
                        Gap(20.sp),
                        TextButton(
                          onPressed: () {
                            if (state is AuthenticationSuccessEmailOTPState) {
                              context.read<AuthenticationBloc>().add(AuthenticationVerifyEmailOtpEvent(email: email, hash: state.hash, otp: context.read<AuthenticationBloc>().emailOtpController.text));
                            }
                          },
                          child: state is AuthenticationEmailVerificationState ? const CircularProgressIndicator.adaptive() : Text("verify".tr),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 16,
                    right: 16,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 100.sp,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        Icon(
                          Icons.mark_email_read_rounded,
                          size: 50.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
