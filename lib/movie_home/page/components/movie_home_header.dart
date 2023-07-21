import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/index.dart';

class MovieHomeHeader extends StatelessWidget {
  const MovieHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26.h),
          Row(
            children: [
              SvgPicture.asset(
                Assets.icons.icClapperboard,
                width: 12.w,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                'MOVIES',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ],
          ),
          SizedBox(height: 9.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'What would you like\nto see today? ',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    // WidgetSpan(
                    //   child: Text(
                    //     'Popular',
                    //     style: GoogleFonts.inter(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.w600,
                    //       decoration: TextDecoration.underline,
                    //       decorationColor: HexColor('#3544C4'),
                    //       color: HexColor('#3544C4'),
                    //     ),
                    //   ),
                    //   alignment: PlaceholderAlignment.middle,
                    //   style: GoogleFonts.inter(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SvgPicture.asset(
                Assets.icons.icSearch,
                width: 16.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
