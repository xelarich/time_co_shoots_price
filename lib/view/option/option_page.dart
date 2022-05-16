import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/provider/weeding_provider.dart';
import 'package:time_co_shoots_price/shared/styles.dart';
import 'package:time_co_shoots_price/shared/utils.dart';
import 'package:time_co_shoots_price/view/option/printing_photo/printing_photo_page.dart';
import 'package:time_co_shoots_price/view/resume/resume_page.dart';

class OptionPage extends StatefulWidget {
  static const routeName = '/option';

  const OptionPage({Key? key}) : super(key: key);

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  final WeddingProvider weddingProvider = GetIt.I.get<WeddingProvider>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("Suppléments",
                style: TextStyle(color: Colors.white)),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => context.pop(),
            ),
            bottom: const TabBar(
              labelColor: Styles.primaryColor,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(text: "Impression photo/toile"),
                Tab(text: "Livre photo standard"),
                Tab(text: "Livre Professional Line"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PrintingPhotoPage(),
              Text('Livre photo standard'),
              Text('Livre Professional Line'),
            ],
          ),
          bottomNavigationBar: ChangeNotifierProvider.value(
            value: weddingProvider,
            child: Consumer<WeddingProvider>(
              builder: (context, weddingProvider, _) {
                return BottomAppBar(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                                'TOTAL ${weddingProvider.getTotalWedding() == null ? "-" : removeTrailingZeros(weddingProvider.getTotalWedding()!)} €')),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  context.push(
                                    ResumePage.routeName,
                                  );
                                },
                                child: const Text("Suivant")))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }

  @override
  void dispose() {
    weddingProvider.reset();
    super.dispose();
  }
}
