import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:time_co_shoots_price/data/local_model/address.dart';
import 'package:time_co_shoots_price/data/local_model/authorization.dart';
import 'package:time_co_shoots_price/data/local_model/client.dart';

class SignatureProvider extends ChangeNotifier {
  Authorization authorization =
      Authorization(client: Client(), address: Address());

  bool secondaryClient = false;
  bool switchClientRepresentation = false;
  bool switchChildRepresentation = false;
  int nbChild = 0;

  void updateSecondaryClient() {
    secondaryClient = !secondaryClient;
    notifyListeners();
  }

  void updateClientRepresentation() {
    switchClientRepresentation = !switchClientRepresentation;
    notifyListeners();
  }

  void updateChildRepresentation() {
    switchChildRepresentation = !switchChildRepresentation;
    notifyListeners();
  }

  void addChild() {
    nbChild = nbChild + 1;
    notifyListeners();
  }

  void addName(String name) {
    authorization.client.name = name;
  }

  void addFirstName(String firstName) {
    authorization.client.firstname = firstName;
  }

  void addSignature(Uint8List image) {
    authorization.signature = image;
  }
}
