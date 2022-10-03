import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:n/movie.dart';
import 'package:n/provider.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
                final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
                themeProvider.changeMode(fromMain: false);
              },
            icon: const Icon(Icons.brightness_4),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  movie.backDrop,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 20, start: 20, top: 10, bottom: 10),
            child: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20, bottom: 10, top: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Overview: ',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontWeight: FontWeight.w900)),
                  TextSpan(
                      text: movie.overview,
                      style: Theme.of(context).textTheme.subtitle2)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 10, bottom: 10, start: 20, end: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Image.asset('assets/images/star.png', height: 20),
                const SizedBox(
                  width: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: movie.rating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontWeight: FontWeight.w900, fontSize: 20)),
                      TextSpan(
                          text: ' of 10',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontSize: 20))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
