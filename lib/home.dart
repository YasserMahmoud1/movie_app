import 'package:flutter/material.dart';
import 'package:n/components.dart';
import 'package:n/popular.dart';
import 'package:n/provider.dart';
import 'package:n/top_rated.dart';
import 'package:n/trending.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Movie App',
          ),
          actions: [
            IconButton(
              onPressed: () {
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.changeMode(fromMain: false);
              },
              icon: const Icon(Icons.brightness_4),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Trending movies',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Trending(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Popular movies',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const Popular(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Top Rated movies',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const TopRated(),
            ],
          ),
        ));
  }
}