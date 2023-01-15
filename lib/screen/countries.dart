import 'package:flutter/material.dart';

import 'package:countries/provider/data.dart';
import 'package:countries/provider/all_data_provider.dart';
import 'package:provider/provider.dart';

import 'package:countries/widgets/country_card.dart';

class Countries extends StatelessWidget {
  const Countries({super.key});

  void go(BuildContext context) {
    Navigator.of(context).pushNamed('/fav');
  }

  @override
  Widget build(BuildContext context) {
    var countries = Provider.of<AllDataProvider>(context);
    return Container(
      color: const Color.fromARGB(193, 255, 17, 0),
      child: SafeArea(
        child: Scaffold(
          body: ListView.builder(
              itemBuilder: ((context, index) {
                return ChangeNotifierProvider<Country>.value(
                    value: countries.countries[index], child: CountryCard());
              }),
              itemCount: countries.countries.length),
          floatingActionButton: FloatingActionButton(
            onPressed: () => go(context),
            backgroundColor: Colors.red,
            child: const Icon(Icons.favorite),
          ),
        ),
      ),
    );
  }
}
