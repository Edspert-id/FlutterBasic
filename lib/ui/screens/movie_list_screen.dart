import 'package:flutter/material.dart';
import 'package:flutter_basic/router/router.dart';
import 'package:go_router/go_router.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: TextButton(
        onPressed: () {
          context.go(
            '${RoutePaths.home}${RoutePaths.movies}/${RoutePaths.movieDetail('starwars')}',
            extra: 'Star Wars Blablabla',
          );
        },
        child: Text('STAR WARS'),
      ),
    );
  }
}
