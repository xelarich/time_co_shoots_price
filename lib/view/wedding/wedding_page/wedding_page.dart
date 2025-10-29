import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/provider/weeding_provider.dart';
import 'package:time_co_shoots_price/service/price_service.dart';
import 'package:time_co_shoots_price/view/option/option_page.dart';
import 'package:time_co_shoots_price/view/wedding/widget/wedding_formula_tile.dart';

class WeddingPage extends StatefulWidget {
  const WeddingPage({super.key});

  @override
  State<WeddingPage> createState() => _WeddingPageState();
}

class _WeddingPageState extends State<WeddingPage> {
  @override
  Widget build(BuildContext context) {
    final PriceService priceService = GetIt.I.get<PriceService>();
    final WeddingProvider weddingProvider = WeddingProvider();
    return Scaffold(
        backgroundColor: Colors.black,
        body: ChangeNotifierProvider.value(
          value: weddingProvider,
          child: Consumer<WeddingProvider>(
            builder: (context, weddingProvider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.grey;
                            }
                            return Theme.of(context)
                                .primaryColor; // Use the component's default.
                          },
                        ),
                      ),
                      onPressed: weddingProvider.selectedIndex.isNegative
                          ? null
                          : () {
                              context.push(OptionPage.routeName);
                            },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Démarrer le devis",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: priceService.getListWeedingType().length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeddingFormulaTile(
                              priceService.getListWeedingType()[index],
                              selected: weddingProvider.selectedIndex == index,
                              onTap: () {
                                weddingProvider.selectWeddingFormula(
                                    priceService.getListWeedingType()[index],
                                    index);
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
