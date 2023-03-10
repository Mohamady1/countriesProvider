import 'package:flutter/material.dart';

import 'package:countries/provider/all_data_provider.dart';
import 'package:countries/provider/data.dart';
import 'package:provider/provider.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text("Great Job!"),
          content: const Text("You have added this item to your favorites"),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final country = Provider.of<Country>(context);
    final countries = Provider.of<AllDataProvider>(context);
    return Card(
      color: Theme.of(context).primaryColor,
      shadowColor: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              country.flag,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(country.country,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor)),
                IconButton(
                  onPressed: () {
                    country.changeLikeToggle();
                    if (country.like) {
                      showCustomDialog(context);
                    } else {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "u deleted it from fav",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                        backgroundColor: Theme.of(context).accentColor,
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "Undo",
                          onPressed: country.changeLikeToggle,
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ));
                    }
                  },
                  icon: country.like
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          color: Colors.red,
                        ),
                ),
                IconButton(
                    onPressed: () => countries.removeCountry(country.flag),
                    icon: const Icon(Icons.delete, color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
