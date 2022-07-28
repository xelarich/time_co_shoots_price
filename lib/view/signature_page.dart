import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:time_co_shoots_price/provider/signature_provider.dart';
import 'package:time_co_shoots_price/shared/extension.dart';
import 'package:time_co_shoots_price/view/pdf_page.dart';

import '../shared/styles.dart';
import 'information/widget/custom_formfield.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final formKey = GlobalKey<FormState>();

  bool clientSecondary = false;
  bool switchValue = false;
  bool switchValueChild = false;

  final SignatureProvider _signatureProvider = SignatureProvider();

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    exportPenColor: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: const Text(
          "Autorisation de diffusion d'image",
          style: TextStyle(fontSize: 20),
        ),
      ),
      Expanded(
        child: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Styles.primaryColor.shade500)),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: ChangeNotifierProvider.value(
              value: _signatureProvider,
              child: Consumer<SignatureProvider>(
                builder: (context, signatureProvider, _) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomFormField(
                                labelText: "Nom",
                                validator: (val) =>
                                    val!.isEmpty ? "Entrer un nom" : null,
                                onChanged: (String val) {
                                  signatureProvider.addName(val);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomFormField(
                                  labelText: "Prénom",
                                  validator: (val) =>
                                      val!.isEmpty ? "Entrer un prénom" : null,
                                  onChanged: (String val) {
                                    signatureProvider.addFirstName(val);
                                  }),
                            ),
                            Visibility(
                              visible: !signatureProvider.secondaryClient ,
                              child: IconButton(
                                  onPressed: () {
                                    signatureProvider.updateSecondaryClient();
                                  },
                                  icon: const Icon(Icons.add_circle_outline)),
                            ),
                          ],
                        ),
                        if (signatureProvider.secondaryClient) ...{
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomFormField(
                                  labelText: "Nom",
                                  validator: (val) =>
                                      val!.isEmpty ? "Entrer un nom" : null,
                                  onChanged: (String val) {},
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomFormField(
                                  labelText: "Prénom",
                                  validator: (val) =>
                                      val!.isEmpty ? "Entrer un prénom" : null,
                                  onChanged: (String val) {},
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    signatureProvider.updateSecondaryClient();
                                  },
                                  icon: const Icon(Icons.cancel_outlined))
                            ],
                          ),
                        },
                        CustomFormField(
                          labelText: "Mail",
                          validator: (val) => val!.isValidEmail()
                              ? null
                              : "Vérifier votre mail",
                          onChanged: (String val) {},
                        ),
                        CustomFormField(
                          labelText: "Téléphone",
                          validator: (val) => !val!.isValidPhone
                              ? "Vérifier votre numéro"
                              : null,
                          onChanged: (String val) {},
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: CustomFormField(
                                labelText: "N°",
                                validator: (val) =>
                                    val!.isEmpty ? "Entrer un numéro" : null,
                                onChanged: (String val) {},
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: CustomFormField(
                                labelText: "Adresse",
                                validator: (val) =>
                                    val!.isEmpty ? "Entrer une adresse" : null,
                                onChanged: (String val) {},
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Je déclare avoir posé librement et volontairement pour être photographiée par TimeCo Shoots dirigé par Mme FROMENT Coralie",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const Text(
                          "(ci-après désigné : « le photographe »)",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                              "J'autorise l'utilisation des photos réalisées ce jour par le photographe sur lesquelles :"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Je suis / Nous sommes représenté(s)",
                            ),
                            Switch(
                              value:
                                  signatureProvider.switchClientRepresentation,
                              activeColor: Styles.primaryColor,
                              onChanged: (_) {
                                signatureProvider.updateClientRepresentation();
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                                "Mon enfant est / Mes enfants sont représenté(s)"),
                            Switch(
                              value:
                                  signatureProvider.switchChildRepresentation,
                              activeColor: Styles.primaryColor,
                              onChanged: (_) {
                                signatureProvider.updateChildRepresentation();
                              },
                            ),
                          ],
                        ),
                        Visibility(
                          visible: false,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed:
                                  signatureProvider.switchChildRepresentation
                                      ? () {
                                          signatureProvider.addChild();
                                        }
                                      : null,
                              icon: const Icon(Icons.add_circle_outline),
                              label: const Text("Ajouter un enfant"),
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                textStyle: const TextStyle(color: Colors.white)),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                showSignatureDialog();
              }
            },
            child: const Text("Continuer")),
      ),
    ]);
  }

  void showSignatureDialog() {
    showModalBottomSheet(
      enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Signature",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Styles.primaryColor),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.clear)),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Signature(
                  controller: _controller,
                  height: 300,
                  width: MediaQuery.of(context).size.height * 0.9,
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                          icon: const Icon(
                            Icons.refresh,
                            size: 14,
                          ),
                          onPressed: () {
                            _controller.clear();
                          },
                          label: const Text("Reset")),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              textStyle: const TextStyle(color: Colors.white)),
                          icon: const Icon(
                            Icons.search_rounded,
                            size: 14,
                          ),
                          onPressed: () async {
                            if (_controller.isNotEmpty) {
                              final image = await _controller.toPngBytes();
                              _signatureProvider.addSignature(image!);
                              if (!mounted) return;
                              context.push(PdfPage.routeName,
                                  extra: _signatureProvider.authorization);
                            }
                          },
                          label: const Text("Signer")),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
