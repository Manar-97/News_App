import 'package:flutter/material.dart';
import 'package:news_app/UI/screens/home/home.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'splash';

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Home.routeName);
    });
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
