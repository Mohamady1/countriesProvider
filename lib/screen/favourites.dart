import 'package:flutter/material.dart';

import 'package:countries/provider/all_data_provider.dart';
import 'package:countries/provider/data.dart';
import 'package:provider/provider.dart';

import 'package:countries/widgets/country_card.dart';

class Favourotes extends StatefulWidget {
  const Favourotes({super.key});

  @override
  State<Favourotes> createState() => _FavourotesState();
}

class _FavourotesState extends State<Favourotes> {
  @override
  Widget build(BuildContext context) {
    final allCountries = Provider.of<AllDataProvider>(context);
    final fav = allCountries.countries.where((item) => item.like);
    return Scaffold(
        appBar: AppBar(
            title: const Text("Favourites Places"),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(193, 255, 17, 0)),
        body: fav.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                        "https://cdni.iconscout.com/illustration/premium/thumb/not-found-4064375-3363936.png"),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          "No Favourites Country Found",
                          style: TextStyle(
                              color: Color.fromARGB(255, 245, 11, 11),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemBuilder: ((context, index) {
                  return ChangeNotifierProvider<Country>.value(
                      value: fav.toList()[index],
                      child: Dismissible(
                          key: ValueKey(fav.toList()[index]),
                          background: Container(
                            color: const Color.fromARGB(255, 160, 11, 0),
                            alignment: Alignment.centerRight,
                            child: const Icon(Icons.delete,
                                color: Colors.white, size: 60),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            fav.toList()[index].changeLikeToggle();
                            setState(() {
                              fav.length - 1;
                            });
                          },
                          child: const CountryCard()));
                }),
                itemCount: fav.length,
              ));
  }
}
