import 'package:flutter/material.dart';

extension SizeExtension on num {
  double get widthFactor =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width /
      375.0;
  double get heightFactor =>
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height /
      812.0;

  double get w => this * widthFactor;
  double get h => this * heightFactor;
  double get a => this * (widthFactor + heightFactor) / 2.0;
}

const kRadiusTopBar = 32.0;
