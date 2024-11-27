import 'package:firebase_auth_cubit/features/home_page/domain/models/note_model.dart';
import 'package:firebase_auth_cubit/features/home_page/domain/repository/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final HomeRepository _home;
  NoteCubit(this._home) : super(NoteInitial());

  Future<void> getNotes() async {
    emit(GetNotesLoading());
    try {
      final notes = await _home.getNotes();
      emit(GetNotesLoaded(notes: notes));
    } catch (e) {
      emit(GetNotesError());
    }
  }

  // add note
  Future<void> addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      await _home.addNote(note);
      emit(AddNoteLoaded());
    } catch (e) {
      emit(AddNoteError());
    }
  }

  // delete note
  Future<void> deleteNote(NoteModel note) async {
    emit(DeleteNoteLoading());
    try {
      await _home.deleteNote(note);
      emit(DeleteNoteLoaded());
    } catch (e) {
      emit(DeleteNoteError());
    }
  }

  // update note
  Future<void> updateNote(NoteModel note) async {
    emit(UpdateNoteLoading());
    try {
      await _home.updateNote(note);
      emit(UpdateNoteLoaded());
    } catch (e) {
      emit(UpdateNoteError());
    }
  }
}
