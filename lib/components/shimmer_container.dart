import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    required this.height,
    this.width,
    this.circular = 14,
    this.alignment = Alignment.centerLeft,
  });

  final double? height;
  final double? width;
  final double circular;
  final Alignment alignment;

  const ShimmerContainer.square({
    super.key,
    this.height,
    this.width,
    this.circular = 0,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circular),
        child: Shimmer(
          child: Container(
            color: Colors.grey[350],
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
