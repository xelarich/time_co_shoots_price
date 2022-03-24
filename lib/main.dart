import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_co_shoots_price/view/home.dart';
import 'package:time_co_shoots_price/view/splashscreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const String title = 'Time Co Shoots Price';

  final GoRouter _goRouter = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', redirect: (_) => Splashscreen.routeName),
    GoRoute(
        path: Splashscreen.routeName,
        builder: (context, state) => const Splashscreen()),
    GoRoute(path: Home.routeName, builder: (context, state) => const Home())
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        routeInformationParser: _goRouter.routeInformationParser,
        routerDelegate: _goRouter.routerDelegate,
      );
}
