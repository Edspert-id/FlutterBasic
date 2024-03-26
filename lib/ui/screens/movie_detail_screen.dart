import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;
  final String movieName;
  const MovieDetailScreen({
    super.key,
    required this.movieId,
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Platform.isIOS ? Icon(Icons.arrow_back_ios) : Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Movie Detail - $movieId'),
      ),
      body: Text('$movieName'),
    );
  }
}
