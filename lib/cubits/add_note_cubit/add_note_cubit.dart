import 'package:bloc/bloc.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  void addNote({required NoteModel notemodel}) async{
    emit(AddNoteLoading());
    try {
      var notebox = Hive.box<NoteModel>(kNotesBox);
      await notebox.add(notemodel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errormessage: e.toString()));
    }
  }
}
