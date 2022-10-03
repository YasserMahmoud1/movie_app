// search
// https://api.themoviedb.org/3/search/movie?api_key=2f8f8d6f2068c7fe7832805515f2cdbb&query={query}
// top rated
// https://api.themoviedb.org/3/movie/top_rated?api_key=2f8f8d6f2068c7fe7832805515f2cdbb
// popular movies
// https://api.themoviedb.org/3/movie/popular?api_key=2f8f8d6f2068c7fe7832805515f2cdbb
// trending movies
// https://api.themoviedb.org/3/trending/movie/week?api_key=2f8f8d6f2068c7fe7832805515f2cdbb
// image
// https://image.tmdb.org/t/p/w500/{image}
import 'package:flutter/material.dart';
import 'package:n/movie_details.dart';

import 'movie.dart';

const String imageProvider = 'https://image.tmdb.org/t/p/w500/';


Widget movieCard({required Movie movie, required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MovieDetails(
                movie: movie,
              )));
    },
    child: SizedBox(
      width: 140,
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movie.poster),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    ),
  );
}
