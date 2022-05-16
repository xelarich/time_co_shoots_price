import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_co_shoots_price/dependency_injection.dart';
import 'package:time_co_shoots_price/shared/styles.dart';
import 'package:time_co_shoots_price/view/home.dart';
import 'package:time_co_shoots_price/view/information/infomation_page.dart';
import 'package:time_co_shoots_price/view/option/option_page.dart';
import 'package:time_co_shoots_price/view/splashscreen.dart';

void main() {
  declareDependencyInjection();

  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const String title = 'TimeCo Shoots Price';

  final GoRouter _goRouter = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', redirect: (_) => Splashscreen.routeName),
    GoRoute(
        path: Splashscreen.routeName,
        builder: (context, state) => const Splashscreen()),
    GoRoute(path: Home.routeName, builder: (context, state) => Home()),
    GoRoute(
        path: InformationPage.routeName,
        builder: (context, state) => InformationPage()),
    GoRoute(
        path: OptionPage.routeName,
        builder: (context, state) => const OptionPage())
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: title,
        theme: ThemeData(
          primaryColor: Styles.primaryColor,
          primarySwatch: Styles.primaryColor,
        ),
        routeInformationParser: _goRouter.routeInformationParser,
        routerDelegate: _goRouter.routerDelegate,
      );
}
