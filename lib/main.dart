import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/views/HomeView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
          headlineLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
          headlineMedium: TextStyle(
              fontSize: 18, color: Theme.of(context).primaryColorDark),
          headlineSmall:
              const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
        )),
      ),
      home: HomeView(),
    );
  }
}
