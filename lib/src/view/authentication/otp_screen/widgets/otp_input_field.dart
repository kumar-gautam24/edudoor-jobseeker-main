import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key});
  @override
  Widget build(BuildContext context) {
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

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return Pinput(
                controller: context.read<AuthenticationBloc>().otpController,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                onTapOutside: (event) => {FocusScope.of(context).requestFocus(FocusNode())},
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                onClipboardFound: (value) {
                  context.read<AuthenticationBloc>().otpController.setText(value);
                },
                onCompleted: (value) {
                  if (state is AuthenticationSuccessOTPState) {
                    context.read<AuthenticationBloc>().add(AuthenticationVerifyOtpEvent(phone: state.phone, isWhatsapp: state.isWhatsapp, hash: state.hash));
                  }
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onSubmitted: (pin) {
                  if (state is AuthenticationSuccessOTPState) {
                    context.read<AuthenticationBloc>().add(AuthenticationVerifyOtpEvent(phone: state.phone, isWhatsapp: state.isWhatsapp, hash: state.hash));
                  }
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: colorBlueLight,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colorBlue),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: colorBlue),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: colorRed),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
