import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          Spacer(flex: 1),
          Ink(
            decoration: BoxDecoration(
              color: Color(0xff383838),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {

                
              },
              icon: Icon(icon),
              color: Colors.white,
              iconSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
