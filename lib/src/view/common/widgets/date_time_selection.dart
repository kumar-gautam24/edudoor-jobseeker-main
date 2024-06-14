import 'package:edudoor_jobseeker/src/helper/date_timer_helper.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_decorations.dart';
import 'package:flutter/material.dart';

class DateTimeSelection extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? suffix;
  final Function onChange;

  const DateTimeSelection({
    super.key,
    required this.controller,
    required this.hint,
    required this.suffix,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: true,
      cursorColor: Colors.black,
      readOnly: true,
      style: TextStyle(
        fontSize: 16.sp,
      ),
      onTap: () {
        _selectDate(context);
      },
      decoration: AppDecoration.inputFieldDecoration(
        context,
        suffix: suffix,
        hint: hint,
      ).inputDecoration,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      controller?.text = pickedDate.formattedDate;
      onChange(pickedDate);
    }
  }
}
