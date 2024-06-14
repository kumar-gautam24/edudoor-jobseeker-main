import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/sizer/sizer_util.dart';
import 'package:flutter/widgets.dart';

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  final ResponsiveBuild builder;
  const Sizer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil.setScreenSize(constraints, orientation);
            return builder(
              context,
              orientation,
              SizerUtil.deviceType
            );
          },
        );
      },
    );
  }
}
