import 'package:flutter/material.dart';
import 'package:news_app/UI/screens/home/splash/splash.dart';
import 'package:news_app/UI/screens/home/tabs/tabs_list_tab/news_details.dart';
import 'UI/screens/home/home.dart';
import 'UI/screens/home/tabs/tabs_list_tab/web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName : (_) =>const Home(),
        Splash.routeName : (_) =>const Splash(),
        NewsDetails.routeName : (_) =>const NewsDetails(),
        WebViewScreen.routeName : (_) => WebViewScreen(),
      },
      initialRoute: Home.routeName,
    );
  }
}