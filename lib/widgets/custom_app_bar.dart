import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Text(
            "Notes",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Spacer(flex: 1),
          Ink(
            decoration: BoxDecoration(color: Color(0xff383838),borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}