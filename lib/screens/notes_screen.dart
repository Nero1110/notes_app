import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/screens/add_note_screen.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: kPrimaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: SafeArea(
        child: Column(children: [CustomAppBar(title: "Notes",icon: Icons.search,), NotesListWidget()]),
      ),
    );
  }
}
