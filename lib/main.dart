import 'package:flutter/material.dart';
import 'package:time_co_shoots_price/view/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Co Shoots Price',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:  Splashscreen(),
    );
  }
}
