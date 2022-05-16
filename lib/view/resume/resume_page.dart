import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:time_co_shoots_price/view/resume/widget/formula_card.dart';

class ResumePage extends StatelessWidget {
  static const routeName = '/resume';
  static const weddingFormulaParamKey = 'weddingFormula';


  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Résumé", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [FormulaCard()],
      ),
    );
  }
}
