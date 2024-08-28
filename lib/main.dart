import 'package:flutter/material.dart';
import 'package:news/home/home_screen.dart';
import 'package:news/home/my_theme_data.dart';
import 'package:news/model/NewsResponse.dart';

import 'home/news_details_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      initialRoute: HomeScreen.routeName,

      theme: MyThemeData.LightTheme,

      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context) {
          final news = ModalRoute.of(context)!.settings.arguments as News;
          return NewsDetailsScreen(news: news);
        },
      },

    );
  }
}