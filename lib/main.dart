import 'package:flutter/material.dart';
import 'package:notes_app/screens/notes_screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 25,
            fontFamily: "Poppins",
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          headlineLarge: TextStyle(fontSize: 27, fontFamily: "Poppins"),
        ),
      ),
      home: const NotesScreen(),
    );
  }
}
