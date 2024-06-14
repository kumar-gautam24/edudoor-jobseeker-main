import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  late final RegExp _digitOnly;
  late final FilteringTextInputFormatter _inputFormatter;

  @override
  void initState() {
    super.initState();
    _digitOnly = RegExp(r'\d+');
    _inputFormatter = FilteringTextInputFormatter.allow(RegExp(r'\d+'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Row(
        children: <Widget>[
          const Expanded(
            flex: 1,
            child: Hint91(),
          ),
          SizedBox(width: 3.w),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return Expanded(
                flex: 4,
                child: SizedBox(
                  height: 45.sp,
                  child: TextFormField(
                    autofillHints: const [
                      AutofillHints.telephoneNumber,
                    ],
                    inputFormatters: [_inputFormatter],
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    cursorRadius: Radius.circular(25.sp),
                    controller: context.read<AuthenticationBloc>().mobileController,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      final isValidPhoneNumber = _digitOnly.hasMatch(value) && value.length == 10;
                      if (isValidPhoneNumber) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                      setState(() {});
                    },
                    onFieldSubmitted: (value) {
                      context.read<AuthenticationBloc>().add(AuthenticationSendOtpEvent());
                    },
                    onTapOutside: (event) => {FocusScope.of(context).requestFocus(FocusNode())},
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.w),
                      hintText: 'enter_phone_number'.tr,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                        color: colorGrey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.w),
                        borderSide: BorderSide(color: Theme.of(context).focusColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.w),
                        borderSide: BorderSide(color: Theme.of(context).focusColor),
                      ),
                      suffixIcon: context.read<AuthenticationBloc>().mobileController.text.length > 9
                          ? Container(
                              height: 14.sp,
                              width: 14.sp,
                              margin: EdgeInsets.all(12.sp),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorGreen,
                              ),
                              child: Icon(
                                Icons.done,
                                color: colorWhite,
                                size: 16.sp,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Hint91 extends StatelessWidget {
  const Hint91({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).focusColor,
          width: 1.sp,
        ),
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Center(
        child: Text(
          '+91',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
