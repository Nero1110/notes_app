import 'package:bloc/bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchNotes() async {
    emit(NotesLoading());
    try {
      List<NoteModel> notes = Hive.box<NoteModel>(
        kNotesBox,
      ).values.toList(); 
      emit(NotesSuccess(notes: notes));
    } catch (e) {
      emit(NotesFailure(errormessage: e.toString()));
    }
  }

  deleteNote(NoteModel noteModel) async {
   await noteModel.delete();
   await fetchNotes();

  }
}
