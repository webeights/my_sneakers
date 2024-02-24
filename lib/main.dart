import 'package:flutter/material.dart';
import 'package:my_sneakers/screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightBlue);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: kColorScheme,
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(),
        ),
      ),
      home: const CategoriesScreen(),
    );
  }
}
