import 'package:flutter/material.dart';

class Country with ChangeNotifier {
  final String flag;
  final String country;
  bool like;

  Country({required this.flag, required this.country, required this.like});

  void changeLikeToggle() {
    like = !like;
    notifyListeners();
  }
}
