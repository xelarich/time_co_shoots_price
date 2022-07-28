import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:time_co_shoots_price/data/local_model/authorization.dart';
import 'package:time_co_shoots_price/view/generate.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);

class PdfPage extends StatelessWidget {
  static const routeName = '/pdfViewer';

  final Authorization authorization;

  const PdfPage({Key? key, required this.authorization}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Information client",
              style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        body: PdfPreview(
          maxPageWidth: 700,
          useActions: false,
          build: (format) => generateResume(format, authorization),
        ));
  }
}
