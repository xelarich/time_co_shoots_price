import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:time_co_shoots_price/service/price_service.dart';
import 'package:time_co_shoots_price/shared/styles.dart';
import 'package:time_co_shoots_price/view/wedding/wedding_option/widget/fomat_tile.dart';

class PhotoPrinting extends StatelessWidget {
  const PhotoPrinting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PriceService _priceService = GetIt.I.get<PriceService>();
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: _priceService.getListPhotoPrinting().length,
      itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormatTile(
        photoPrintingFormat: _priceService.getListPhotoPrinting()[index],
      ),
    );
      },
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
