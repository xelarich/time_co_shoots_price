import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/data/local_model/photo_printing.dart';
import 'package:time_co_shoots_price/provider/weeding_provider.dart';
import 'package:time_co_shoots_price/view/option/printing_photo/printing_photo_tile.dart';

class PrintingPhotoList extends StatefulWidget {
  final PhotoPrinting photoPrinting;

  const PrintingPhotoList(this.photoPrinting, {Key? key}) : super(key: key);

  @override
  State<PrintingPhotoList> createState() => _PrintingPhotoListState();
}

class _PrintingPhotoListState extends State<PrintingPhotoList> {
  final WeddingProvider weddingProvider = GetIt.I.get<WeddingProvider>();
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: weddingProvider,
      child: Consumer<WeddingProvider>(
        builder: (context, weddingProvider, _) {
          return ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 1,
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        for (final format in widget.photoPrinting.sizes) ...{
                          PrintingPhotoTile(
                            photoPrintingFormat: format,
                            onFieldSubmitted: (int value) {
                              weddingProvider.updateWeddingPhoto(
                                  widget.photoPrinting, format, value);
                            },
                            initialValue: weddingProvider.getInitialValue(
                                widget.photoPrinting, format),
                          )
                        }
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.photoPrinting.name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                  isExpanded: _expanded,
                  canTapOnHeader: true,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  _expanded = !_expanded;
                });
              });
        },
      ),
    );
  }
}
