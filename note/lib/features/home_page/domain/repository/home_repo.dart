import 'package:firebase_auth_cubit/features/home_page/domain/models/note_model.dart';

abstract class HomeRepository {
  Future<List<NoteModel>> getNotes();
  Future<void> addNote(NoteModel note);
  Future<void> deleteNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
}
