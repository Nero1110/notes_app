import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NotesListWidget extends StatefulWidget {
  const NotesListWidget({super.key});

  @override
  State<NotesListWidget> createState() => _NotesListWidgetState();
}

class _NotesListWidgetState extends State<NotesListWidget> {
  @override
  initState() {
    super.initState();
    context.read<NotesCubit>().fetchNotes();
  }
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final formatted = DateFormat('MMM d, yyyy').format(today);
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NotesSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return CustomNoteItem(noteModel: state.notes[index]);
              },
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3,
            ),
            child: Text(
              "Add your first note",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          );
        }
      },
    );
  }
}
