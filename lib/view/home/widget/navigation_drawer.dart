import 'package:convex_bottom_bar/src/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/provider/navigation_provider.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class NavigationDrawer extends StatelessWidget {
  List<TabItem<IconData>> navigationOptions;
  List<Widget> navigationPage;

  NavigationDrawer(this.navigationOptions, this.navigationPage, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, _) {
        return Drawer(
          backgroundColor: Colors.black,
          child: Column(
            children: [
              DrawerHeader(
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  const Center(
                    child:
                        Image(image: AssetImage("assets/images/icon_app.png")),
                  ),
                ]),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: navigationPage.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        child: ListTile(
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          title:
                              Text(navigationOptions.elementAt(index).title!),
                          leading:
                              Icon(navigationOptions.elementAt(index).icon),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          selected: navigationProvider.selectedIndex == index,
                          selectedTileColor: Styles.primaryColor.shade200,
                          onTap: () {
                            navigationProvider.onItemTapped(index);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
