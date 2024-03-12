import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic/constants/app_images.dart';
import 'package:flutter_basic/constants/route_constant.dart';
import 'package:flutter_basic/data/movie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/banner_widget.dart';
import '../../widgets/home_top_bar_widget.dart';
import '../../widgets/now_playing_widget.dart';

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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const HomeTopBarWidget(),
        const SizedBox(height: 20),
        const BannerWidget(),
        const SizedBox(height: 30),
        NowPlayingWidget(moviesData: moviesData),
        const SizedBox(height: 30),
      ],
    );
  }
}
