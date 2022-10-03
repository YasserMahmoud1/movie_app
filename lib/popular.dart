import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:n/movie.dart';

import 'components.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  List<Movie> popular = [];
  bool dataArrived = false;
  @override
  void initState() {
    getpopular();
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
                for (int i = 0; i < popular.length; i++)
                  movieCard(movie: popular[i], context: context)
              ],
            ),
    );
  }

  void getpopular() async {
    final result = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=2f8f8d6f2068c7fe7832805515f2cdbb'));
    Map popularMap = jsonDecode(result.body);
    for (int i = 0; i < popularMap['results'].length; i++) {
      popular.add(Movie(
        backDrop: imageProvider + popularMap['results'][i]['backdrop_path'],
        overview: popularMap['results'][i]['overview'],
        poster: imageProvider + popularMap['results'][i]['poster_path'],
        rating: popularMap['results'][i]['vote_average'].toStringAsFixed(1),
        title: popularMap['results'][i]['title'],
      ));
    }
    dataArrived = true;
    setState(() {});
  }
}
