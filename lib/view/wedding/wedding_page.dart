import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/provider/weeding_provider.dart';
import 'package:time_co_shoots_price/service/price_service.dart';
import 'package:time_co_shoots_price/view/option/option_page.dart';
import 'package:time_co_shoots_price/view/wedding/widget/wedding_formula_tile.dart';

class WeddingPage extends StatefulWidget {
  const WeddingPage({Key? key}) : super(key: key);

  @override
  State<WeddingPage> createState() => _WeddingPageState();
}

class _WeddingPageState extends State<WeddingPage> {
  final PriceService _priceService = GetIt.I.get<PriceService>();
  final WeddingProvider weddingProvider = GetIt.I.get<WeddingProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ChangeNotifierProvider.value(
          value: weddingProvider,
          child: Consumer<WeddingProvider>(
            builder: (context, weddingProvider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _priceService.getListWeedingType().length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeddingFormulaTile(
                              _priceService.getListWeedingType()[index],
                              selected: weddingProvider.selectedIndex == index,
                              onTap: () {
                                weddingProvider.selectWeddingFormula(
                                    _priceService.getListWeedingType()[index],
                                    index);
                                context.push(OptionPage.routeName);
                              },
                            ));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
