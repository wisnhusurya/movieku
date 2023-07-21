// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// import '../../../router/index.dart';
// import 'index.dart';

// class MovieHomeList<T> extends StatelessWidget {
//   const MovieHomeList({super.key, required this.data});

//   final List<T> data;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 260.w,
//       child: ListView.separated(
//         padding: EdgeInsets.zero,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           final movie = data[index];
//           final isFirstIndex = index == 0;
//           final isLastIndex = index == data.length - 1;

//           return Padding(
//             padding: EdgeInsets.only(
//               left: isFirstIndex ? 30.w : 0,
//               right: isLastIndex ? 30.w : 0,
//             ),
//             child: MovieHomeCard(
//               movie: movie,
//               onTap: () => context.push(
//                 Routes.movieDetail,
//                 extra: movie.id,
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) => SizedBox(width: 20.w),
//         itemCount: data.length,
//       ),
//     );
//   }
// }
