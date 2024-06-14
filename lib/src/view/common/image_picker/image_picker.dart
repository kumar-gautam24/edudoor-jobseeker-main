import 'dart:io';

import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/view/common/gradients/all_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomImagePicker {
  final _picker = ImagePicker();

  Widget _buildImageModalButton({context, index, icon, text, source, Function? handleFinish}) {
    return TextButton(
      onPressed: () async {
        XFile? image = await getImage(
          context: context,
          source: source,
          maxWidthImage: 600,
        );
        AppNavigator.pop();
        if (image != null && handleFinish != null) {
          handleFinish(File(image.path));
        }
      },
      style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 0),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.black.withOpacity(0.5);
              }
              return Colors.black; // Use the component's default.
            },
          ),
          overlayColor: WidgetStateProperty.all<Color>(Colors.transparent)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.sp),
        child: Row(
          children: [
            Icon(
              icon,
              size: 21.25.sp,
            ),
            SizedBox(
              width: 15.sp,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage({context, source = ImageSource.gallery, maxWidthImage, imageQualityImage}) async {
    return await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1000,
    );
  }

  Future openImagePicker({
    required context,
    text = 'Choose a source',
    Function? handleFinish,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SizedBox(
          height: 210.sp,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 500.sp, blurStyle: BlurStyle.outer),
                  ],
                  gradient: AllGradient.primaryGradient,
                ),
                height: 170.sp,
                width: double.infinity,
                padding: EdgeInsets.only(left: 18.sp, right: 18.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.sp,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    _buildImageModalButton(
                      context: context,
                      index: 0,
                      icon: PhosphorIcons.instagramLogo(),
                      text: 'gallery'.tr,
                      source: ImageSource.gallery,
                      handleFinish: handleFinish,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 0.5,
                      color: Color(0xffe5e5e5),
                    ),
                    _buildImageModalButton(
                      context: context,
                      index: 1,
                      icon: PhosphorIcons.camera(),
                      text: 'camera'.tr,
                      source: ImageSource.camera,
                      handleFinish: handleFinish,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
