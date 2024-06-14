import 'dart:math' as math;

import 'package:edudoor_jobseeker/src/sizer/sizer_util.dart';

// ignore: constant_identifier_names
const _INCH_TO_DP = 160.0;

extension SizerExt on num {
  double get h => this * SizerUtil.height / 100;
  double get w => this * SizerUtil.width / 100;

  double get width {
    double deviceSize = math.sqrt(100.h * 100.h + 100.w * 100.w) / _INCH_TO_DP;
    if (deviceSize > 6.5) {
      return 65.w * (6.5 / deviceSize);
    } else if (deviceSize > 5.5) {
      return 100.w;
    } else if (deviceSize > 5.0) {
      return 90.w;
    } else {
      return 85.w;
    }
  }

  bool get isTablet {
    double deviceSize = math.sqrt(100.h * 100.h + 100.w * 100.w) / _INCH_TO_DP;
    if (deviceSize > 6.5) {
      return true;
    }
    return false;
  }

  double get sp => this * (width / 3) / 100;

  int get itemCountGridViewCalendar {
    return (100.w / (150.sp)).round();
  }

  int get itemCountGridViewMoney {
    return (100.w / (100.sp)).round();
  }
}
