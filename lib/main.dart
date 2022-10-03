import 'package:flutter/material.dart';
import 'package:n/cache_helper.dart';
import 'package:n/provider.dart';
import 'package:provider/provider.dart';
import 'components.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.int();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        bool? isDark = CacheHelper.getData();
        themeProvider.changeMode(fromShared: isDark, fromMain: true);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: Colors.black),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              subtitle1: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis),
              subtitle2: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
          darkTheme: ThemeData(
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: Colors.white),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              backgroundColor: Colors.black,
            ),
            scaffoldBackgroundColor: Colors.black,
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              subtitle1: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              subtitle2: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
          home: const Home(),
        );
      },
    );
  }
}
