import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowedImage extends StatelessWidget {
  const ShadowedImage({
    super.key,
    required this.image,
  });

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      key: key,
      children: <Widget>[
        Transform.translate(
          offset: Offset(0, 20.w),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 20.w,
              sigmaY: 20.w,
              tileMode: TileMode.decal,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70.r),
              child: image,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: image,
        ),
      ],
    );
  }
}
