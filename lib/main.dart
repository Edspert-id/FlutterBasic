import 'package:flutter/material.dart';
import 'package:flutter_basic/constants/app_colors.dart';
import 'package:flutter_basic/constants/route_constant.dart';
import 'package:go_router/go_router.dart';

import 'data/movie.dart';
import 'screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Basic',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Rale way',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/splash',
            name: RouteConstant.splash,
            builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
          ),
          GoRoute(
            path: '/login',
            name: RouteConstant.login,
            builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
          ),
          GoRoute(
            path: '/registration',
            name: RouteConstant.registration,
            builder: (BuildContext context, GoRouterState state) => const RegistrationScreen(),
          ),
          GoRoute(
            path: '/',
            name: RouteConstant.main,
            builder: (BuildContext context, GoRouterState state) => const MainScreen(),
            routes: [
              GoRoute(
                path: 'movies',
                name: RouteConstant.movieList,
                builder: (BuildContext context, GoRouterState state) => const MovieListScreen(),
              ),
              GoRoute(
                path: 'movies/:movieId',
                name: RouteConstant.movieDetail,
                builder: (BuildContext context, GoRouterState state) {
                  String movieId = state.pathParameters['movieId'] as String;
                  return MovieDetailScreen(
                    movieId: movieId,
                    movie: state.extra as Movie,
                  );
                },
              ),
              GoRoute(
                path: 'order_date',
                name: RouteConstant.selectMovieTime,
                builder: (BuildContext context, GoRouterState state) {
                  return SelectMovieTimeScreen(
                    movie: state.extra as Movie,
                  );
                },
              ),
              GoRoute(
                path: 'order_seat',
                name: RouteConstant.selectMovieSeat,
                builder: (BuildContext context, GoRouterState state) => const SelectSeatScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
