import 'package:flutter/material.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class Splashscreen extends StatelessWidget {
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
                colors: [ Styles.secondaryColor, Colors.black],
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
