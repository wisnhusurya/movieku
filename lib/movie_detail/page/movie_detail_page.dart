import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieku/resources/index.dart';

import '../../utils/strings.dart';
import '../cubits/movie_detail_cubit.dart';
import '../repositories/movie_detail_repository.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.id});

  final int id;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final cubit = MovieDetailCubit(repository: MovieDetailRepository());

  @override
  void initState() {
    super.initState();
    cubit.getMovieDetail(widget.id);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state.movieLoadData.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.movieLoadData.isHasData) {
              final movie = state.movieLoadData.data!;

              return Stack(
                children: [
                  SizedBox.expand(
                    child: Image.network(
                      '${Strings.urlImagePosterW500}${movie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.white.withOpacity(0.4),
                    width: 1.sw,
                    height: 1.sh,
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top + 10.w,
                        ),
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              Assets.icons.icClose,
                              width: 24.w,
                            ),
                          ),
                        ),
                        SizedBox(height: 80.w),
                        Center(
                          child: Container(
                            width: 1.sw / 2,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.6),
                                width: 5.w,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                '${Strings.urlImagePosterW500}${movie.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60.w),
                        Text(
                          movie.title,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.white),
                        ),
                        Text(
                          movie.genres.map((e) => e.name).join(', '),
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return GestureDetector(
              onTap: () => cubit.getMovieDetail(widget.id),
              child: Center(
                child: Text(state.movieLoadData.message),
              ),
            );
          },
        ),
      ),
    );
  }
}
