import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.labelText,
    this.inputFormatters,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  final String labelText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: (String str) {
          onChanged(str);
        },
        inputFormatters: inputFormatters,
        validator: validator,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 10),
            labelText: labelText,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      ),
    );
  }
}
