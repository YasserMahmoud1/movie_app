import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:n/movie.dart';

import 'components.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  @override
  List<Movie> topRated = [];
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
                for (int i = 0; i < topRated.length; i++)
                  movieCard(movie: topRated[i], context: context)
              ],
            ),
    );
  }

  void getTrending() async {
    final result = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=2f8f8d6f2068c7fe7832805515f2cdbb'));
    Map topRatingMap = jsonDecode(result.body);
    for (int i = 0; i < topRatingMap['results'].length; i++) {
      topRated.add(Movie(
        backDrop: imageProvider + topRatingMap['results'][i]['backdrop_path'],
        overview: topRatingMap['results'][i]['overview'],
        poster: imageProvider + topRatingMap['results'][i]['poster_path'],
        rating: topRatingMap['results'][i]['vote_average'].toStringAsFixed(1),
        title: topRatingMap['results'][i]['title'],
      ));
    }
    dataArrived = true;
    setState(() {});
  }
}
