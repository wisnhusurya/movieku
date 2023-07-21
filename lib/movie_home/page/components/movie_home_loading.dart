import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/index.dart';

class MovieHomeLoading extends StatelessWidget {
  const MovieHomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.w,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          final isFirstIndex = index == 0;
          final isLastIndex = index == 3;

          return Padding(
            padding: EdgeInsets.only(
              left: isFirstIndex ? 30.w : 0,
              right: isLastIndex ? 30.w : 0,
            ),
            child: ShimmerContainer(
              width: 206.w,
              height: 260.w,
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(
          width: 20.w,
        ),
      ),
    );
  }
}
