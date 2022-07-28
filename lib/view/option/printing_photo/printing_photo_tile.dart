import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_co_shoots_price/data/local_model/photo_printing.dart';
import 'package:time_co_shoots_price/provider/weeding_provider.dart';
import 'package:time_co_shoots_price/shared/styles.dart';
import 'package:time_co_shoots_price/shared/utils.dart';

class PrintingPhotoTile extends StatelessWidget {
  final PhotoSize photoPrintingFormat;
  final Function(int) onFieldSubmitted;
  final String? initialValue;

  const PrintingPhotoTile(
      {required this.photoPrintingFormat,
      required this.onFieldSubmitted,
      this.initialValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 18, top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Format ${photoPrintingFormat.format} cm'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Prix unitaire : ${removeTrailingZeros(photoPrintingFormat.price)} €',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            height: 40,
            child: _ChangeQuantityTextField(
              onFieldSubmitted: (int value) => onFieldSubmitted(value),
              initialValue: initialValue,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChangeQuantityTextField extends StatefulWidget {
  final Function(int) onFieldSubmitted;
  final String? initialValue;

  const _ChangeQuantityTextField(
      {Key? key, required this.onFieldSubmitted, this.initialValue})
      : super(key: key);

  @override
  _ChangeQuantityTextFieldState createState() =>
      _ChangeQuantityTextFieldState();
}

class _ChangeQuantityTextFieldState extends State<_ChangeQuantityTextField> {
  final formKey = GlobalKey<FormState>();
  int photoQuantities = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<WeddingProvider>(
      builder: (context, weddingProvider, _) {
        return Form(
          key: formKey,
          child: TextFormField(
            textAlign: TextAlign.center,
            cursorWidth: 1,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            initialValue: widget.initialValue ?? "",
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.primaryColor.shade500,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Styles.primaryColor.shade300,
                ),
              ),
            ),
            style: const TextStyle(
              fontSize: 22,
            ),
            onChanged: (value) {
              value.isEmpty
                  ? photoQuantities = 0
                  : photoQuantities = int.parse(value);
            },
            onFieldSubmitted: (term) async {
              if (formKey.currentState!.validate()) {
                widget.onFieldSubmitted(photoQuantities);
              }
            },
          ),
        );
      },
    );
  }
}
