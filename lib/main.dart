import 'package:flutter/material.dart';

import 'package:countries/provider/all_data_provider.dart';
import 'package:provider/provider.dart';

import 'package:countries/screen/countries.dart';
import 'package:countries/screen/favourites.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: ((context) => AllDataProvider()),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Countries(),
        "/fav": (context) => const Favourotes()
      },
    );
  }
}
