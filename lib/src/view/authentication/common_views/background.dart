import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Background extends StatelessWidget {
  final String firstImagePath, secondImagePath;
  final AlignmentGeometry firstAlignment, secondAlignment;

  const Background({super.key, required this.firstAlignment, required this.secondAlignment, required this.firstImagePath, required this.secondImagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: BackgroundImage(
            imagePath: firstImagePath,
            alignment: firstAlignment,
          ),
        ),
        Positioned(
          bottom: 0,
          child: BackgroundImage(
            imagePath: secondImagePath,
            alignment: secondAlignment,
          ),
        ),
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  final AlignmentGeometry alignment;

  const BackgroundImage({super.key, required this.imagePath, required this.alignment});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 40.h,
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.fill,
        alignment: alignment,
      ),
    );
  }
}
