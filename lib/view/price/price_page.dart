import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:time_co_shoots_price/service/price_service.dart';
import 'package:time_co_shoots_price/view/price/widget/wedding_formula_tile.dart';

class PricePage extends StatefulWidget {
  const PricePage({Key? key}) : super(key: key);

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final PriceService _priceService = GetIt.I.get<PriceService>();
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                  visible: !selectedIndex.isNegative,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: ElevatedButton(
                      child: const Text(
                        "Démarrer le devis",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {},
                    ),
                  )),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _priceService.getListWeedingType().length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WeddingFormulaTile(
                        _priceService.getListWeedingType()[index],
                        selected: selectedIndex == index,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ));
                },
              )
            ],
          ),
        ));
  }
}
