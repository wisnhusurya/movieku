// const MovieHomeHeader(),
//                   SizedBox(height: 30.w),
//                   if (state.popularMoviesLoadData.isLoading) ...[
//                     SizedBox(
//                       height: 260.w,
//                       child: ListView.separated(
//                         padding: EdgeInsets.zero,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 4,
//                         itemBuilder: (context, index) {
//                           final isFirstIndex = index == 0;
//                           final isLastIndex = index == 3;

//                           return Padding(
//                             padding: EdgeInsets.only(
//                               left: isFirstIndex ? 30.w : 0,
//                               right: isLastIndex ? 30.w : 0,
//                             ),
//                             child: ShimmerContainer(
//                               width: 206.w,
//                               height: 260.w,
//                             ),
//                           );
//                         },
//                         separatorBuilder: (_, __) => SizedBox(
//                           width: 20.w,
//                         ),
//                       ),
//                     )
//                   ],
//                   if (state.popularMoviesLoadData.isHasData) ...[
//                     SizedBox(
//                       height: 260.w,
//                       child: ListView.separated(
//                         padding: EdgeInsets.zero,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           final movie =
//                               state.popularMoviesLoadData.data![index];
//                           final isFirstIndex = index == 0;
//                           final isLastIndex = index ==
//                               state.popularMoviesLoadData.data!.length - 1;

//                           return Padding(
//                             padding: EdgeInsets.only(
//                               left: isFirstIndex ? 30.w : 0,
//                               right: isLastIndex ? 30.w : 0,
//                             ),
//                             child: MovieHomeCard(
//                               movie: movie,
//                               onTap: () => context.push(
//                                 Routes.movieDetail,
//                                 extra: movie.id,
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) =>
//                             SizedBox(width: 20.w),
//                         itemCount: state.popularMoviesLoadData.data!.length,
//                       ),
//                     ),
//                   ],
//                   if (state.popularMoviesLoadData.isError) ...[
//                     GestureDetector(
//                       onTap: () => cubit.getPopularMovies(),
//                       child: Center(
//                         child: Text(
//                           state.popularMoviesLoadData.message,
//                           style: GoogleFonts.poppins(),
//                         ),
//                       ),
//                     ),
//                   ],
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30).w,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 50.w),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Popular Actor's",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               'See all',
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 20.w),
//                         SizedBox(
//                           width: 77.w,
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: 77.w,
//                                 height: 77.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15.r),
//                                   color: Colors.pink,
//                                 ),
//                               ),
//                               SizedBox(height: 10.w),
//                               Text(
//                                 "Robert De Niro",
//                                 style: GoogleFonts.poppins(),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),