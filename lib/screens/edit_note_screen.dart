import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: "Edit Note", icon: Icons.done),
            CustomTextField(
              hinttext: "Title",
              maxlines: 1,
              controller: titleController,
            ),
            CustomTextField(
              hinttext: "Content",
              maxlines: 6,
              controller: contentController,
            ),
          ],
        ),
      ),
    );
  }
}
