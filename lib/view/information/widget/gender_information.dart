import 'package:flutter/material.dart';

import '../../../shared/styles.dart';

class GenderInformation extends StatefulWidget {
  const GenderInformation({Key? key}) : super(key: key);

  @override
  State<GenderInformation> createState() => _GenderInformationState();
}

enum Gender { mr, mme }

class _GenderInformationState extends State<GenderInformation> {
  Gender? _groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Sélectionner la civilité"),
        for (final gender in Gender.values) ...{
          Row(
            children: [
              Radio<Gender>(
                value: gender,
                groupValue: _groupValue,
                onChanged: (newValue) => setState(
                  () {
                    _groupValue = newValue!;
                  },
                ),
                activeColor: Styles.primaryColor.shade500,
              ),
              Text(getGender(gender))
            ],
          ),
        },
      ],
    );
  }

  String getGender(Gender gender) {
    switch (gender) {
      case Gender.mr:
        return "Monsieur";
      case Gender.mme:
        return "Madame";
    }
  }
}
