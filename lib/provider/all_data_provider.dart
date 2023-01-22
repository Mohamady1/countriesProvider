import 'package:flutter/material.dart';
import 'package:countries/provider/data.dart';

class AllDataProvider with ChangeNotifier {
  List<Country> countries = [
    Country(
      flag:
          "https://images.pexels.com/photos/3999943/pexels-photo-3999943.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      country: "Turkey",
      like: false,
    ),
    Country(
        flag:
            "https://images.pexels.com/photos/161849/cologne-dom-night-architecture-161849.jpeg?auto=compress&cs=tinysrgb&w=600",
        country: "Germany",
        like: false),
    Country(
        flag:
            "https://images.pexels.com/photos/262780/pexels-photo-262780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        country: "Egypt",
        like: false),
    Country(
        flag:
            "https://images.pexels.com/photos/2087387/pexels-photo-2087387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        country: "Palestine",
        like: false),
    Country(
        flag:
            "https://images.pexels.com/photos/1737957/pexels-photo-1737957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        country: "United State",
        like: false),
    Country(
        flag:
            "https://images.pexels.com/photos/1750754/pexels-photo-1750754.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        country: "Canada",
        like: false),
    Country(
        flag:
            "https://images.pexels.com/photos/3424845/pexels-photo-3424845.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        country: "Holland",
        like: false),
  ];

  void addCountry(Country country) {
    countries.add(country);
    notifyListeners();
  }

  void removeCountry(String flag) {
    countries.removeWhere((element) => element.flag == flag);
    notifyListeners();
  }
}
