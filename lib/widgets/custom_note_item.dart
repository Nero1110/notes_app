import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final formatted = DateFormat('MMM d, yyyy').format(today);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Container(
        height: 220,
        width: 360,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter tips",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: 210,
                    child: Text(
                      "Build your Career with Tharwat Samy",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black.withValues(alpha: 0.4),
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, size: 35, color: Colors.black),
                  ),
                  SizedBox(height: 100),
                  Text(
                    formatted,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
