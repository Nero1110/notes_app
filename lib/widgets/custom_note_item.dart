import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_note_screen.dart';

class CustomNoteItem extends StatefulWidget {
  const CustomNoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<CustomNoteItem> createState() => _CustomNoteItemState();
}

class _CustomNoteItemState extends State<CustomNoteItem> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final formatted = DateFormat('MMM d, yyyy').format(today);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteScreen();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Container(
          height: 220,
          width: 360,
          decoration: BoxDecoration(
            color: Color(widget.noteModel.color),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 210,
                      child: Text(
                        widget.noteModel.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                    SizedBox(
                      width: 210,
                      child: Text(
                        widget.noteModel.content,
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
                      onPressed: ()async {
                      await  context.read<NotesCubit>().deleteNote(widget.noteModel);  
                        

                      },
                      icon: Icon(Icons.delete, size: 35, color: Colors.black),
                    ),
                    SizedBox(height: 100),
                    Text(
                      widget.noteModel.date,
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
      ),
    );
  }
}
