import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  void addNote({required NoteModel notemodel}) async {
    try {
      emit(AddNoteLoading());
      var notebox = notesBox;
      await notebox.add(notemodel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errormessage: e.toString()));
      
    }
  }
}
