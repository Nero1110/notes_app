import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required GlobalKey<FormState> formkey,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff53EBD6),
        fixedSize: Size(380, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(7),
        ),
      ),
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Note is added successfully'),
            ),
          );
          Navigator.pop(context);
        }
      },
      child: Text(
        "Add",
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}