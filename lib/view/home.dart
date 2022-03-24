import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/main.dart';
import 'package:time_co_shoots_price/provider/bottom_bar_provider.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  final _bottomOptions = const [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.map, title: 'Discovery'),
  ];

  final _widgetOptions = const [
    Text('page1'),
    Text('page2'),
  ];

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
      value: GetIt.I.get<BottomBarProvider>(),
      child: Consumer<BottomBarProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: AppBar(title: const Text(App.title)),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.reactCircle,
            activeColor: Colors.black,
            backgroundColor: Styles.secondaryColor,
            items: _bottomOptions,
            onTap: (index) => provider.onItemTapped(index),
          ),
          body: _widgetOptions.elementAt(provider.selectedIndex),
        ),
      ));
}
