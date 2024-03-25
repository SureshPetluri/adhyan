import 'package:flutter/material.dart';

class AppGap extends StatelessWidget {
  const AppGap({super.key, this.w, this.h});

  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
    );
  }
}
