import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../data/local_model/authorization.dart';

Future<Uint8List> generateResume(
    PdfPageFormat format, Authorization authorization) async {
  final doc = Document(
      title: "Autorisation de diffusion d'image", author: 'Coralie Froment');

  final font1 = await PdfGoogleFonts.openSansRegular();

  final qrCode = MemoryImage(
    (await rootBundle.load("assets/images/custom_qr_code.png")).buffer.asUint8List(),
  );

  final white = PdfColor.fromHex("FFFFFFFF");
  final black = PdfColor.fromHex("00000000");

  doc.addPage(Page(
      pageTheme: PageTheme(
          pageFormat: format.copyWith(marginTop: 1 * PdfPageFormat.cm),
          orientation: PageOrientation.portrait,
          theme: ThemeData(
              defaultTextStyle: TextStyle(font: font1),
              paragraphStyle: TextStyle(font: font1),
              textAlign: TextAlign.justify)),
      build: (Context context) => Column(
        children: [
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                  "Autorisation d'utilisation et publication d'image",
                  textScaleFactor: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Je soussigné(e) : ${authorization.client.firstname} ${authorization.client.name!.toUpperCase()}"),
              Text(
                  "Demeurant au 58 rue Martin Luther King 59620 Aulnoye-Aymeries"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Téléphone: 0648375453"),
                  Text("Mail: richard-alex@hotmail.fr"),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  "Autorise TimeCo Shoots dirigé par Mme FROMENT Coralie "),
              Paragraph(
                text: "(ci-après désigné : « le photographe »)",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Paragraph(
                  text: "À me photographier le 27/07/2022 à Béthune"),
              SizedBox(
                height: 8,
              ),
              Text(
                  "Conformément aux dispositions relatives au droit à l'image, au droit d'auteur et au respect de la vie privée.",
                  textAlign: TextAlign.justify),
              Text(
                  "J’autorise le photographe à fixer, reproduire et communiquer au public les photographies prises dans le cadre de la séance ou :"),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, right: 8),
                      child: Checkbox(
                          value: true,
                          name: "adult",
                          decoration:
                              BoxDecoration(border: Border.all(width: 3)),
                          activeColor: white,
                          checkColor: black)),
                  Text("Je suis / Nous sommes représenté(s)")
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, right: 8),
                      child: Checkbox(
                          value: true,
                          name: "children",
                          decoration:
                              BoxDecoration(border: Border.all(width: 3)),
                          activeColor: white,
                          checkColor: black)),
                  Text("Mon enfant est / Mes enfants sont représenté(s)")
                ],
              ),
              Text(
                  "Les photographies pourront être exploitées et utilisées directement par le photographe, sous toute forme et tous supports connus et inconnus à ce jour, dans le monde entier, sans limitation de durée."),
              SizedBox(
                height: 8,
              ),
              Text(
                  "De son côté, le photographe s’interdit expressément de procéder à une exploitation desphotographies susceptible de porter atteinte à la vie privée ou à la réputation, et d’utiliserles photographies de la présente, dans tout support à caractère pornographique, raciste,xénophobe ou toute autre exploitation préjudiciable."),
              SizedBox(
                height: 8,
              ),
              Text(
                  "Le photographe vous autorise la diffussion de ses photos sur tout support à condition de citer son nom en accompagnement des photographies."),
              SizedBox(
                height: 8,
              ),
              Text(
                  "Je me reconnais être entièrement rempli de mes droits et je ne pourrai prétendre à aucune rémunération pour l’exploitation des droits visés aux présentes."),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                text:
                  "Fait à Aulnoye-Aymeries, le 27/07/2022, en deux exemplaires"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Paragraph(text: "Signature"),
                    Image(MemoryImage(authorization.signature!),
                        height: 100, width: 100 )
                  ],
                ),
                Image(qrCode,height: 100, width: 100),
              ])
            ],
          )
        ],
      )));
  return doc.save();
}
