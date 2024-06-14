
import 'package:edudoor_jobseeker/src/constants/assets_path.dart';
import 'package:edudoor_jobseeker/src/view/authentication/common_views/background.dart';
import 'package:edudoor_jobseeker/src/view/authentication/login_screen/widgets/login_foreground.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Background(
            firstImagePath: AssetsPath.BACKGROUND_IMAGE_FIRST,
            secondImagePath: AssetsPath.BACKGROUND_IMAGE_SECOND,
            firstAlignment: Alignment.topRight,
            secondAlignment: Alignment.bottomLeft,
          ),
          LoginForeground(),
        ],
      ),
    );
  }
}
