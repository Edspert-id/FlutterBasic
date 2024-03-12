import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../constants/route_constant.dart';
import '../data/movie.dart';
import 'movie_image_widget.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({
    super.key,
    required this.moviesData,
  });

  final List<Movie>? moviesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(width: 16),
            Text('Sedang Tayang'),
            Expanded(child: SizedBox()),
            Text('Lihat Semua'),
            SizedBox(width: 16),
          ],
        ),
        SizedBox(
          height: 240,
          width: double.infinity,
          child: moviesData == null
              ? const Center(
                  child: SizedBox(height: 40, width: 40, child: CircularProgressIndicator()),
                )
              : moviesData!.isEmpty
                  ? const Text('Tidak ada film tersedia.')
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 8,
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 14);
                      },
                      itemBuilder: (context, int index) {
                        return MovieListItemWidget(
                          movie: moviesData![index],
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

class MovieListItemWidget extends StatelessWidget {
  final Movie movie;
  const MovieListItemWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          RouteConstant.movieDetail,
          pathParameters: {
            'movieId': 'Movie-${movie.title}',
          },
          extra: movie,
        );
      },
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            MovieImageWidget(movie: movie),
            Text(
              movie.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
