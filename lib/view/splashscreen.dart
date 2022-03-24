import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

import 'home.dart';

class Splashscreen extends StatefulWidget {
  static const routeName = '/splashscreen';

  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  _SplashscreenState() {
    Future.delayed(const Duration(seconds: 5), () {
      context.go(Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 1,
                colors: [Styles.secondaryColor, Colors.black],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 75.0,
                child: Icon(
                  Icons.verified_user,
                  size: 50.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
