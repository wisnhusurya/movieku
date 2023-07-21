import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FrostedContainer extends StatelessWidget {
  const FrostedContainer({
    super.key,
    required this.child,
    this.height,
    this.padding,
  });

  final Widget child;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: height,
          padding: padding ?? EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white60,
                Colors.white60,
              ],
            ),
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: child,
        ),
      ),
    );
  }
}
