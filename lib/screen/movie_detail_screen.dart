import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic/constants/route_constant.dart';
import 'package:flutter_basic/widgets/movie_image_widget.dart';
import 'package:go_router/go_router.dart';

import '../data/movie.dart';
import '../widgets/movie_content_box_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movieId, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                movie.thumbnailUrl,
                height: 215,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Icon(Icons.play_arrow),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 20,
              ),
              MovieImageWidget(
                movie: movie,
                height: 190,
                width: 130,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Director'), Text('Ronaldo')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Director'), Text('Ronaldo')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Director'), Text('Ronaldo')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Director'), Text('Ronaldo')],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: MovieContentBoxWidget(
                  title: Text('Rating'),
                  value: '8.3/10',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: MovieContentBoxWidget(
                  title: Text('Duration'),
                  value: '120m',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: MovieContentBoxWidget(
                  title: Text('PG'),
                  value: '13+',
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(
              RouteConstant.selectMovieTime,
              extra: movie,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie_outlined),
              SizedBox(
                width: 8,
              ),
              const Text('Beli Tiket'),
            ],
          ),
        ),
      ),
    );
  }
}
