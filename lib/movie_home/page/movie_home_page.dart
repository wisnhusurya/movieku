import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieku/movie_home/cubits/movie_cubit.dart';
import 'package:movieku/movie_home/repositories/movie_home_repository.dart';

import '../../router/index.dart';
import 'components/index.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final cubit = MovieCubit(repository: MovieHomeRepository());

  @override
  void initState() {
    super.initState();
    cubit
      ..getPopularMovies()
      ..getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MovieHomeHeader(),
                  SizedBox(height: 30.w),
                  if (state.popularMoviesLoadData.isLoading) ...[
                    const MovieHomeLoading(),
                  ],
                  if (state.popularMoviesLoadData.isHasData) ...[
                    SizedBox(
                      height: 260.w,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final movie =
                              state.popularMoviesLoadData.data![index];
                          final isFirstIndex = index == 0;
                          final isLastIndex = index ==
                              state.popularMoviesLoadData.data!.length - 1;

                          return Padding(
                            padding: EdgeInsets.only(
                              left: isFirstIndex ? 30.w : 0,
                              right: isLastIndex ? 30.w : 0,
                            ),
                            child: MovieHomeCard.popular(
                              moviePopular: movie,
                              onTap: () => context.push(
                                Routes.movieDetail,
                                extra: movie.id,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20.w),
                        itemCount: state.popularMoviesLoadData.data!.length,
                      ),
                    ),
                  ],
                  if (state.popularMoviesLoadData.isError) ...[
                    MovieHomeError(
                      onTap: () => cubit.getPopularMovies(),
                      message: state.popularMoviesLoadData.message,
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trending Movie',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'See all',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.w),
                      ],
                    ),
                  ),
                  if (state.trendingMoviesLoadData.isLoading) ...[
                    const MovieHomeLoading(),
                  ],
                  if (state.trendingMoviesLoadData.isHasData) ...[
                    SizedBox(
                      height: 260.w,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final movie =
                              state.trendingMoviesLoadData.data![index];
                          final isFirstIndex = index == 0;
                          final isLastIndex = index ==
                              state.trendingMoviesLoadData.data!.length - 1;

                          return Padding(
                            padding: EdgeInsets.only(
                              left: isFirstIndex ? 30.w : 0,
                              right: isLastIndex ? 30.w : 0,
                            ),
                            child: MovieHomeCard.trending(
                              movieTrending: movie,
                              onTap: () => context.push(
                                Routes.movieDetail,
                                extra: movie.id,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20.w),
                        itemCount: state.trendingMoviesLoadData.data!.length,
                      ),
                    ),
                  ],
                  if (state.trendingMoviesLoadData.isError) ...[
                    MovieHomeError(
                      onTap: () => cubit.getPopularMovies(),
                      message: state.trendingMoviesLoadData.message,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
