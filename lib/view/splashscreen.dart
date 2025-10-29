import 'package:flutter/material.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class Splashscreen extends StatefulWidget {
  static const routeName = '/splashscreen';

  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
