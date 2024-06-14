import 'package:edudoor_jobseeker/src/constants/assets_path.dart';
import 'package:edudoor_jobseeker/src/view/authentication/common_views/background.dart';
import 'package:edudoor_jobseeker/src/view/authentication/otp_screen/widgets/verify_foreground.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {

  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Background(
            firstImagePath: AssetsPath.BACKGROUND_IMAGE_FIRST,
            secondImagePath: AssetsPath.BACKGROUND_IMAGE_SECOND,
            firstAlignment: Alignment.topRight,
            secondAlignment: Alignment.topRight,
          ),
          VerifyForeground()
        ],
      ),
    );
  }
}
