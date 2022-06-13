import 'package:flutter/material.dart';
import 'package:time_co_shoots_price/shared/styles.dart';

class VisitPage extends StatelessWidget {
  const VisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Image(
                image: AssetImage("assets/images/custom_qr_code.png"),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Styles.primaryColor)),
              child: const Text(
                "Scannez et découvrez moi !",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                maxLines: 1,
              ))
        ],
      ),
    );
  }
}
