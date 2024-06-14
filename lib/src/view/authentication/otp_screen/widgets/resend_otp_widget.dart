import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/count_down/count_down_bloc.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendOtpWidget extends StatelessWidget {
  const ResendOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountDownBloc, CountDownState>(
      builder: (context, state) {
        if (state is CountDownInProcessState) {
          return TextButton(
            onPressed: null,
            child: Text(
              'Resend OTP in ${state.duration} seconds',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
              ),
            ),
          );
        }

        return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                if (state is AuthenticationSuccessOTPState) {
                  context.read<AuthenticationBloc>().add(AuthenticationResendOtpEvent(phone: state.phone, isWhatsapp: state.isWhatsapp));
                }
              },
              child: Text(
                'Resend OTP',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
