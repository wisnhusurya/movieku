import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieku/components/frosted_container.dart';
import 'package:movieku/resources/index.dart';

import '../../../models/index.dart';
import '../../../utils/strings.dart';

class MovieHomeCard extends StatelessWidget {
  const MovieHomeCard.popular({
    super.key,
    required this.moviePopular,
    required this.onTap,
  }) : movieTrending = null;

  const MovieHomeCard.trending({
    super.key,
    required this.movieTrending,
    required this.onTap,
  }) : moviePopular = null;

  final MoviePopularMdl? moviePopular;
  final MovieTrendingMdl? movieTrending;
  final VoidCallback onTap;

  bool get isPopular => moviePopular != null;
  String get posterPath =>
      isPopular ? moviePopular!.posterPath : movieTrending!.posterPath;
  double get voteAverage =>
      isPopular ? moviePopular!.voteAverage : movieTrending!.voteAverage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
              width: 206.w,
              height: 260.w,
              child: CachedNetworkImage(
                imageUrl: '${Strings.urlImagePosterW200}$posterPath',
                fit: BoxFit.cover,
                width: 206.w,
                height: 260.w,
                progressIndicatorBuilder: (context, child, loadingProgress) {
                  return SpinKitFoldingCube(
                    itemBuilder: (context, index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    },
                    size: 50.w,
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 206.w,
                    height: 260.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            top: 20.w,
            left: 20.w,
            child: FrostedContainer(
              height: 32.w,
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.icStar,
                    width: 12.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '$voteAverage',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20.w,
            right: 20.w,
            child: FrostedContainer(
              height: 32.w,
              child: SvgPicture.asset(
                Assets.icons.icHeart,
                width: 12.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
