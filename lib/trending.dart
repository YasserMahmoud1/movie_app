import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:n/movie.dart';

import 'components.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  List<Movie> trending = [];
  bool dataArrived = false;
  @override
  void initState() {
    getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: !dataArrived
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                for (int i = 0; i < trending.length; i++)
                  movieCard(movie: trending[i], context: context)
              ],
            ),
    );
  }

  void getTrending() async {
    final result = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/day?api_key=2f8f8d6f2068c7fe7832805515f2cdbb'));
    Map trendingMap = jsonDecode(result.body);
    for (int i = 0; i < trendingMap['results'].length; i++) {
      trending.add(Movie(
        backDrop: imageProvider + trendingMap['results'][i]['backdrop_path'],
        overview: trendingMap['results'][i]['overview'],
        poster: imageProvider + trendingMap['results'][i]['poster_path'],
        rating: trendingMap['results'][i]['vote_average'].toStringAsFixed(1),
        title: trendingMap['results'][i]['title'],
      ));
    }
    dataArrived = true;
    setState(() {});
  }
}
