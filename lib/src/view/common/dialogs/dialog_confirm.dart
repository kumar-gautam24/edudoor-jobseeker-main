import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DialogConfirm extends StatefulWidget {
  final String title;
  final String subTitle;
  final double? height;
  final bool isCancelBtn;
  final Widget? child;
  final String cancelBtnText;
  final String confirmBtnText;
  final VoidCallback? handleCancel;
  final VoidCallback? handleConfirmBtn;

  const DialogConfirm({
    super.key,
    required this.subTitle,
    required this.title,
    this.height,
    this.isCancelBtn = true,
    this.cancelBtnText = 'Cancel',
    this.confirmBtnText = 'OK',
    this.handleCancel,
    this.handleConfirmBtn,
    this.child,
  });

  @override
  State<StatefulWidget> createState() => _DialogConfirmState();
}

class _DialogConfirmState extends State<DialogConfirm> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 300.sp,
        maxWidth: 95.w,
        minHeight: 180.sp,
        maxHeight: 40.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 6.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Text(
                          widget.title,
                          // style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
                        ),
                      ),
                      SizedBox(height: 6.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 7.5.sp),
                        child: Text(
                          widget.subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.5.sp, color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(.5) ?? Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      widget.child ??
                          Icon(
                            PhosphorIcons.warning(PhosphorIconsStyle.fill),
                            color: colorRedDark,
                            size: 100.sp,
                          ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        AppNavigator.pop();
                      }, // widget.handleCancel,
                      child: Text(
                        widget.cancelBtnText,
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.sp),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        AppNavigator.pop();
                        widget.handleConfirmBtn?.call();
                      }, // widget.handleConfirmBtn,
                      child: Text(
                        widget.confirmBtnText,
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
