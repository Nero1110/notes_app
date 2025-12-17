import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: _formkey,
      child: Column(
        children: [
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

          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: CustomButton(
              formkey: _formkey,
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  final today = DateTime.now();
                  final formatted = DateFormat('MMM d, yyyy').format(today);
                  var notemodel = NoteModel(
                    title: titleController.text,
                    content: contentController.text,
                    color: Colors.blue.value,
                    date: formatted,
                  );
                  context.read<AddNoteCubit>().addNote(notemodel: notemodel);

                  
                  
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
