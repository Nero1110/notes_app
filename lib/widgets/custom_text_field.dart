import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hinttext,
    required this.maxlines,
  });
  final int maxlines;
  final String hinttext;
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
                maxLines: maxlines,
                style: TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle: TextStyle(color: Color(0xff53EBD6), fontSize: 18),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53EBD6)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53EBD6)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53EBD6)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53EBD6)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff53EBD6)),
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
