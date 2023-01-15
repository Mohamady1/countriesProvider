import 'package:flutter/material.dart';

class Country with ChangeNotifier {
  final int id;
  final String flag;
  final String country;
  bool like;

  Country(
      {required this.id,
      required this.flag,
      required this.country,
      required this.like});

  void changeLikeToggle() {
    like = !like;
    notifyListeners();
  }
}
