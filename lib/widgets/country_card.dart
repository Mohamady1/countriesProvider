import 'package:flutter/material.dart';

import 'package:countries/provider/data.dart';
import 'package:provider/provider.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final country = Provider.of<Country>(context);
    return Card(
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: country.changeLikeToggle,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
