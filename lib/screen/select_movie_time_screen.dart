import 'package:flutter/material.dart';

import '../data/movie.dart';

class SelectMovieTimeScreen extends StatefulWidget {
  final Movie movie;
  const SelectMovieTimeScreen({super.key, required this.movie});

  @override
  State<SelectMovieTimeScreen> createState() => _SelectMovieTimeScreenState();
}

class _SelectMovieTimeScreenState extends State<SelectMovieTimeScreen> {
  List<DateTime> availableDates = [];
  late DateTime selectedDate;

  @override
  void initState() {
    DateTime today = DateTime.now();
    selectedDate = today;
    availableDates.add(today);
    for (int i = 0; i < 8; i++) {
      availableDates.add(today.add(Duration(days: i + 1)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.movie.title),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 55,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: availableDates.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedDate == availableDates[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedDate = availableDates[index];
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Monday',
                        style: TextStyle(fontSize: isSelected ? 16 : 14),
                      ),
                      Text(
                        '19',
                        style: TextStyle(fontSize: isSelected ? 20 : 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ExpansionTile(
            title: Row(
              children: [
                Icon(Icons.abc),
                Text(
                  'CGV Jakarta',
                )
              ],
            ),
            children: [
              Container(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 16,
                      children: [
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                        Text('16:00'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
