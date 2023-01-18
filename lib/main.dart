import 'package:flutter/material.dart';

import 'package:countries/provider/all_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:countries/provider/toggle_theme_provider.dart';

import 'package:countries/screen/countries.dart';
import 'package:countries/screen/favourites.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: ((context) => AllDataProvider()),
      ),
      ChangeNotifierProvider(create: (((context) => ToggleTheme())))
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ToggleTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.setColors(),
      routes: {
        "/": (context) => const Countries(),
        "/fav": (context) => const Favourotes()
      },
    );
  }
}
