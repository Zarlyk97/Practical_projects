import 'package:firebase_auth_cubit/features/home_page/data/data_source/home_remote_data_source.dart';
import 'package:firebase_auth_cubit/features/home_page/domain/models/note_model.dart';
import 'package:firebase_auth_cubit/features/home_page/domain/repository/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<void> addNote(NoteModel note) {
    return homeRemoteDataSource.addNote(note);
  }

  @override
  Future<void> deleteNote(NoteModel note) {
    return homeRemoteDataSource.deleteNote(note);
  }

  @override
  Future<List<NoteModel>> getNotes() {
    return homeRemoteDataSource.getNotes();
  }

  @override
  Future<void> updateNote(NoteModel note) {
    return homeRemoteDataSource.updateNote(note);
  }
}
