import 'package:expenses/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyAPP());
}

var myColorSheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 93, 165));

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expenses",
      theme: ThemeData().copyWith(
        colorScheme: myColorSheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myColorSheme.onPrimaryContainer,
            foregroundColor: myColorSheme.onSecondary),
        cardTheme: CardTheme().copyWith(
          color: myColorSheme.primaryContainer,
          margin: EdgeInsets.all(10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myColorSheme.primary,
                foregroundColor: myColorSheme.onPrimary)),
      ),
      home: const Expenses(),
    );
  }
}
