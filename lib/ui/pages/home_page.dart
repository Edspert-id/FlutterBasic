import 'package:flutter/material.dart';
import 'package:flutter_basic/router/router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Top Bar',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
          Text('Promo List'),
          TextButton(
            onPressed: () {
              context.go('${RoutePaths.home}${RoutePaths.movies}');
            },
            child: Text('Lihat Semua'),
          ),
          TextButton(
            onPressed: () {
              context.go(
                '${RoutePaths.home}${RoutePaths.movieDetail('marvels')}',
                extra: 'Captain Marvel',
              );
            },
            child: Text('marvels'),
          ),
        ],
      ),
    );
  }
}
