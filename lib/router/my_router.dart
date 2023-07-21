import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieku/movie_detail/page/movie_detail_page.dart';
import 'package:movieku/movie_home/page/movie_home_page.dart';

import 'index.dart';

class MyRouter {
  static final goRouter = GoRouter(
    initialLocation: Routes.movieHome,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.movieHome,
        pageBuilder: (context, state) {
          return const MaterialPage<dynamic>(
            name: Routes.movieHome,
            child: MovieHomePage(),
          );
        },
      ),
      GoRoute(
        path: Routes.movieDetail,
        pageBuilder: (context, state) {
          return MaterialPage<dynamic>(
            name: Routes.movieHome,
            child: MovieDetailPage(
              id: state.extra as int? ?? 0,
            ),
          );
        },
      ),
    ],
  );
}
