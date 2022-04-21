import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:time_co_shoots_price/main.dart';
import 'package:time_co_shoots_price/service/infomartion_service.dart';
import 'package:time_co_shoots_price/shared/extension.dart';
import 'package:time_co_shoots_price/shared/styles.dart';
import 'package:time_co_shoots_price/view/information/widget/custom_formfield.dart';
import 'package:time_co_shoots_price/view/information/widget/gender_information.dart';

class InformationPage extends StatefulWidget {
  static const routeName = '/information';

  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final formKey = GlobalKey<FormState>();
  final InformationService _informationService =
      GetIt.I.get<InformationService>();

  String? nom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(App.title, style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Styles.primaryColor.shade500)),
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Information client",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const GenderInformation(),
                      const Visibility(child: Text("Sélectionner la civilité")),
                      CustomFormField(
                        labelText: "Nom",
                        validator: (val) =>
                            val!.isEmpty ? "Entrer un nom" : null,
                      ),
                      CustomFormField(
                        labelText: "Prénom",
                        validator: (val) =>
                            val!.isEmpty ? "Entrer un prénom" : null,
                      ),
                      CustomFormField(
                        labelText: "Mail",
                        validator: (val) =>
                            val!.isValidEmail() ? null : "Vérifier votre mail",
                      ),
                      CustomFormField(
                        labelText: "Téléphone",
                        validator: (val) =>
                            !val!.isValidPhone ? "Vérifier votre numéro" : null,
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: CustomFormField(
                              labelText: "N°",
                              validator: (val) =>
                                  val!.isEmpty ? "Entrer un numéro" : null,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: CustomFormField(
                              labelText: "Adresse",
                              validator: (val) =>
                                  val!.isEmpty ? "Entrer une adresse" : null,
                            ),
                          ),
                        ],
                      ),
                      CustomFormField(
                        labelText: "Complément d'adresse",
                      ),
                      Row(
                        children: [
                          Flexible(
                              flex: 2,
                              child: CustomFormField(
                                labelText: "Code Postal",
                                validator: (val) => !val!.isValidPostalCode
                                    ? "Indiquer un code postal"
                                    : null,
                              )),
                          Expanded(
                              flex: 2,
                              child: CustomFormField(
                                labelText: "Ville",
                                validator: (val) =>
                                    val!.isEmpty ? "Indiquer une ville" : null,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Continuer",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        _informationService.genderSelected) {}
                  })
            ],
          ),
        ),
      ),
    );
  }
}
