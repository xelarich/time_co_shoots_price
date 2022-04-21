import 'package:flutter/material.dart';
import 'package:time_co_shoots_price/data/local_model/photo_printing_format.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class FormatTile extends StatelessWidget {
  final PhotoPrintingFormat photoPrintingFormat;

  const FormatTile({required this.photoPrintingFormat, Key? key})
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
                  'Prix unitaire : ${photoPrintingFormat.price} €',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 60,
            height: 40,
            child: _ChangeQuantityTextField(),
          ),
        ],
      ),
    );
  }
}

class _ChangeQuantityTextField extends StatefulWidget {
  const _ChangeQuantityTextField({Key? key}) : super(key: key);

  @override
  _ChangeQuantityTextFieldState createState() =>
      _ChangeQuantityTextFieldState();
}

class _ChangeQuantityTextFieldState extends State<_ChangeQuantityTextField> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        initialValue: 0.toString(),
        textAlign: TextAlign.center,
        cursorWidth: 1,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
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
        onChanged: (value) {},
        onFieldSubmitted: (term) async {
          if (formKey.currentState!.validate()) {}
        },
      ),
    );
  }
}
