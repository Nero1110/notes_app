import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/notes_screen.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
BlocProvider(create: (context)=>AddNoteCubit())
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
