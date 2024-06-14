import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class CircularAvatar extends StatelessWidget {
  final bool isActive;
  final String? urlToImage;
  final String? blurHash;
  final num size;
  final Widget? child;
  final int strokeSize;
  const CircularAvatar({
    super.key,
    required this.isActive,
    this.urlToImage,
    this.blurHash,
    this.size = 24,
    this.strokeSize = 2,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.sp,
      width: size.sp,
      padding: EdgeInsets.all(1.25.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyMedium?.color ?? Theme.of(context).primaryColor,
          width: strokeSize.sp,
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000.sp),
          child: child ??
              BlurHash(
                hash: blurHash ?? 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
                image: urlToImage ?? "'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png'",
                imageFit: BoxFit.cover,
                duration: const Duration(milliseconds: 500),
                color: isActive ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyMedium?.color ?? Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
