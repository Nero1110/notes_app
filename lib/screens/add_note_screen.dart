import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
 AutovalidateMode autoValidateMode =AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode:autoValidateMode ,
      key: _formkey,
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
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
                child: CustomButton(formkey: _formkey,onPressed:  () {
        if (_formkey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Note is added successfully')),
          );
          Navigator.pop(context);
        } else {
          autoValidateMode=AutovalidateMode.always;
          setState(() {
            
          });
      
        }
      },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


