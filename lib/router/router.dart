import 'package:flutter_basic/ui/screens/login_screen.dart';
import 'package:flutter_basic/ui/screens/movie_detail_screen.dart';
import 'package:flutter_basic/ui/screens/movie_list_screen.dart';
import 'package:flutter_basic/ui/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../ui/screens/home_screen.dart';
import '../ui/screens/register_screen.dart';

class RoutePaths {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/';
  static const String movies = 'movies';
  static String movieDetail(String movieId) => 'movie_detail/$movieId';
}

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: RoutePaths.movies,
          builder: (context, state) => const MovieListScreen(),
          routes: [
            GoRoute(
              path: RoutePaths.movieDetail(':movie_id'),
              builder: (context, state) => MovieDetailScreen(
                movieId: state.pathParameters['movie_id'] as String,
                movieName: state.extra as String,
              ),
            ),
          ],
        ),
        GoRoute(
          path: RoutePaths.movieDetail(':movie_id'),
          builder: (context, state) => MovieDetailScreen(
            movieId: state.pathParameters['movie_id'] as String,
            movieName: state.extra as String,
          ),
        ),
      ],
    ),
  ],
);
