import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:time_co_shoots_price/service/price_service.dart';
import 'package:time_co_shoots_price/view/option/printing_photo/printing_photo_list.dart';

class PrintingPhotoPage extends StatefulWidget {
  const PrintingPhotoPage({Key? key}) : super(key: key);

  @override
  State<PrintingPhotoPage> createState() => _PrintingPhotoPageState();
}

class _PrintingPhotoPageState extends State<PrintingPhotoPage> {
  final PriceService _priceService = GetIt.I.get<PriceService>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _priceService.getListPhotoPrinting().length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PrintingPhotoList(_priceService.getListPhotoPrinting()[index]),
        );
      },
    );
  }
}
