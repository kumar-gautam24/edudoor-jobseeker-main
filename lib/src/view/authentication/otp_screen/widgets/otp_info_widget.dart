import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpInfoWidget extends StatelessWidget {
  const OtpInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          buildWhen: (previous, current) => current is AuthenticationSuccessOTPState,
          builder: (context, state) {
            if (state is AuthenticationSuccessOTPState) {
              return Text(
                state.phone,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        InkWell(
          child: IconButton(
            icon: const Icon(
              Icons.edit,
            ),
            onPressed: () {
              AppNavigator.pop();
            },
          ),
        ),
      ],
    );
  }
}
