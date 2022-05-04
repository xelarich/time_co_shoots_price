import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:time_co_shoots_price/data/local_model/wedding_formula.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class WeddingFormulaTile extends StatefulWidget {
  final WeddingFormula weddingType;
  final bool selected;
  final Function onTap;

  const WeddingFormulaTile(this.weddingType,
      {required this.selected, required this.onTap, Key? key})
      : super(key: key);

  @override
  State<WeddingFormulaTile> createState() => _WeddingFormulaTileState();
}

class _WeddingFormulaTileState extends State<WeddingFormulaTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(widget.weddingType.name,
                    gradientType: GradientType.radial,
                    colors: [
                      Styles.primaryColor.shade200,
                      Styles.primaryColor.shade300,
                      Styles.primaryColor.shade500
                    ],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "${widget.weddingType.price} €",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            for (final event in widget.weddingType.events!) ...{
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(event.pathIcon!),
                      size: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        event.description!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            },
            if (widget.weddingType.extra != null &&
                widget.weddingType.extra!.isNotEmpty) ...{
              const Text(
                "Extra",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "${widget.weddingType.extra}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            },
            if (widget.weddingType.commentary != null &&
                widget.weddingType.commentary!.isNotEmpty) ...{
              Text(
                "${widget.weddingType.commentary}",
                style: const TextStyle(fontStyle: FontStyle.italic),
              )
            }
          ],
        ),
      ),
    );
  }
}
