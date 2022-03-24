import 'package:flutter/material.dart';
import 'package:time_co_shoots_price/main.dart';


class Home extends StatelessWidget {
  static const routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(App.title)),
    body: const Center(
      child: Text('HomePage'),
    ),
  );
}