import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

class CustomRadioBtn extends StatelessWidget {
  final List<String>? buttonList;
  final List<dynamic>? buttonValues;
  final bool horizontal;
  final Function(dynamic, int)? radioButtonValue;
  final int initialSelection;
  const CustomRadioBtn({
    super.key,
    required this.initialSelection,
    this.buttonList ,
    this.buttonValues,
    this.horizontal = true,
    this.radioButtonValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRadioButton(
      buttonLables: buttonList,
      buttonValues: buttonList,
      radioButtonValue: radioButtonValue,
      horizontal: horizontal,
      enableShape: true,
      buttonSpace: 5,
      elevation: 100,
      initialSelection: initialSelection,
      buttonColor: colorWhite,
      selectedColor: Theme.of(context).primaryColor,
      buttonWidth: 125.sp,
      buttonHeight: 40.sp,
    );
  }
}
