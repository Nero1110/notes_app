import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hinttext,
    required this.maxlines,
    required this.controller,
  });
  final int maxlines;
  final String hinttext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: TextFormField(
                cursorErrorColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                },
                controller: controller,
                maxLines: maxlines,
                style: TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.red, fontSize: 14),
                  hintText: hinttext,
                  hintStyle: TextStyle(color: kPrimaryColor, fontSize: 18),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
