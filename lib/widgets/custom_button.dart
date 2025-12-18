import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required GlobalKey<FormState> formkey,
    required this.onPressed,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        fixedSize: Size(380, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(7),
        ),
      ),
      onPressed: onPressed,
      child: BlocBuilder<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          return state is AddNoteLoading
              ? CircularProgressIndicator()
              : Text(
                  "Add",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                );
        },
      ),
    );
  }
}
