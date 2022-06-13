import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_co_shoots_price/shared/styles.dart';
import 'package:time_co_shoots_price/view/home/home.dart';

class Splashscreen extends StatefulWidget {
  static const routeName = '/splashscreen';

  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  _SplashscreenState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.push(Home.routeName);
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
                colors: [Styles.primaryColor, Colors.black],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Styles.primaryColor.shade500,
                radius: 110,
                child: const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/icon_app.png"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
