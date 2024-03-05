import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/constants/route_constant.dart';
import 'package:flutter_basic/data/movie.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie>? moviesData;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        moviesData = null;
      });

      String dummyMoviesJsonString = await rootBundle.loadString('assets/json/dummy_movies.json');
      print('dummyMoviesJsonString: $dummyMoviesJsonString');
      List<dynamic> dummyMoviesMap = jsonDecode(dummyMoviesJsonString)['movies'] as List<dynamic>;
      print('dummyMoviesMap: $dummyMoviesMap');

      setState(() {
        // moviesData = dummyMoviesMap
        //     .map((element) => Movie(title: element['title'] ?? '', thumbnailUrl: element['thumbnail'] ?? ''))
        //     .toList();

        moviesData = dummyMoviesMap.map((element) => Movie.fromMap(element)).toList();
      });

      setState(() {
        moviesData = [];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FlutterCarousel(
          options: CarouselOptions(
            height: 400.0,
            showIndicator: true,
            slideIndicator: const CircularSlideIndicator(),
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              },
            );
          }).toList(),
        ),
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
                        return InkWell(
                          onTap: () {
                            context.goNamed(
                              RouteConstant.movieDetail,
                              pathParameters: {
                                'movieId': 'Movie-$index',
                              },
                            );
                          },
                          child: Container(
                            width: 100,
                            child: Column(
                              children: [
                                Image.network(
                                  moviesData?[index].thumbnailUrl ?? '',
                                  height: 200,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  moviesData?[index].title ?? '',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        )
      ],
    );
  }
}
