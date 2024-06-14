import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendOtpButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final Widget? child;
  final bool isWhatsapp;
  const SendOtpButton({super.key, required this.color, required this.child, required this.onTap, required this.isWhatsapp});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 45.sp,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoadingOTPState) {
            return isWhatsapp == state.isWhatsapp
                ? Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(isWhatsapp ? colorGreenDark : colorPurple),
                    ),
                  )
                : _ButtonInternalContainer(onTap: null, child: child);
          }
          if (state is AuthenticationLoadingState) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(colorPurple),
              ),
            );
          } else {
            return _ButtonInternalContainer(onTap: onTap, child: child);
          }
        },
      ),
    );
  }
}

class _ButtonInternalContainer extends StatelessWidget {
  const _ButtonInternalContainer({
    required this.onTap,
    required this.child,
  });

  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 45.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
