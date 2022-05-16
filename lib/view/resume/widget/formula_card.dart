import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:time_co_shoots_price/data/local_model/wedding_formula.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class FormulaCard extends StatelessWidget {

  const FormulaCard( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientText("Formule",
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
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Ajouter remise'),
                    ),
                  )
                ],
              )
            ],
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Text("name"),
          Text("price"),
        ],
      ),
    );
  }
}
