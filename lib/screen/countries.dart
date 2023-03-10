import 'package:countries/provider/toggle_theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:countries/provider/data.dart';
import 'package:countries/provider/all_data_provider.dart';
import 'package:provider/provider.dart';

import 'package:countries/widgets/country_card.dart';

class Countries extends StatelessWidget {
  const Countries({super.key});

  void goToFav(BuildContext context) {
    Navigator.of(context).pushNamed('/fav');
  }

  void goToAddCountry(BuildContext context) {
    Navigator.of(context).pushNamed('/add');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ToggleTheme>(context);
    final countries = Provider.of<AllDataProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        leading: const Icon(Icons.flight_takeoff),
        title: Text("Countries",
            style: TextStyle(color: Theme.of(context).accentColor)),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Theme.of(context).accentColor),
            onPressed: () => goToAddCountry(context),
          ),
          IconButton(
              onPressed: theme.toggleTheme,
              icon: theme.dark
                  ? const Icon(Icons.sunny)
                  : const Icon(Icons.nights_stay)),
        ],
      ),
      body: countries.countries.isEmpty
          ? Center(
              child: Text(
                "No Countries Add one now",
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 25),
              ),
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return ChangeNotifierProvider<Country>.value(
                    value: countries.countries[index],
                    child: const CountryCard());
              }),
              itemCount: countries.countries.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToFav(context),
        child: const Icon(
          Icons.favorite_outline,
        ),
      ),
    );
  }
}
