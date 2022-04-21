import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_co_shoots_price/main.dart';
import 'package:time_co_shoots_price/shared/styles.dart';
import 'package:time_co_shoots_price/view/wedding/wedding_option/widget/photo_printing.dart';

class WeddingOption extends StatelessWidget {
  static const routeName = '/wedding_option';

  const WeddingOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(App.title, style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => GoRouter.of(context).pop(),
          ),
          bottom: const TabBar(
            labelColor: Styles.primaryColor,
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            tabs: [
              Tab(text: "Tirage photo"),
              Tab(text: "Impression photo/toile"),
              Tab(text: "Livre photo standard"),
              Tab(text: "Livre Professional Line"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PhotoPrinting(),
            Text('Impression photo/toile'),
            Text('Livre photo standard'),
            Text('Livre Professional Line'),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: Row(
              children: [
              const Expanded(flex: 1,child: Text('TOTAL')), Expanded(child: ElevatedButton(onPressed: (){}, child: const Text("Suivant")))
            ],),
          ),
        ),
      ),
    );
  }
}
