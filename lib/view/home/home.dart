import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/main.dart';
import 'package:time_co_shoots_price/provider/navigation_provider.dart';
import 'package:time_co_shoots_price/view/home/widget/navigation_drawer.dart';
import 'package:time_co_shoots_price/view/information/infomation_page.dart';
import 'package:time_co_shoots_price/view/visit/visit_page.dart';
import 'package:time_co_shoots_price/view/wedding/wedding_page.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  final _navigationOptions = const [
    TabItem(icon: Icons.map, title: 'Mariage'),
    TabItem(icon: Icons.home, title: 'Studio'),
    TabItem(icon: Icons.qr_code_2_outlined, title: 'Visiter ma page'),
    TabItem(icon: Icons.description_outlined, title: 'Créer autorisations'),
  ];

  final _navigationPage = [
    const WeddingPage(),
    const Center(child: Text('Studio page')),
    const VisitPage(),
    InformationPage(
      statePermission: true,
    ),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
      value: GetIt.I.get<NavigationProvider>(),
      child: Consumer<NavigationProvider>(
        builder: (context, provider, _) => Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              App.title,
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
              ),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
          ),
          drawer: NavigationDrawer(_navigationOptions, _navigationPage),
          body: _navigationPage.elementAt(provider.selectedIndex),
        ),
      ));
}
