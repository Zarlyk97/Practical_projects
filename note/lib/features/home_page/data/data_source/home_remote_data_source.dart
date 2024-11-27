import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_cubit/features/home_page/domain/models/note_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<NoteModel>> getNotes();
  Future<List<NoteModel>> searchNotes(String query);
  Future<void> addNote(NoteModel note);
  Future<void> deleteNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addNote(NoteModel note) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('notes')
          .add(note.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('notes')
          .doc(note.id)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('notes')
          .get();
      return snapshot.docs
          .map((doc) => NoteModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('notes')
          .doc(note.id)
          .update(note.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<NoteModel>> searchNotes(String query) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection('notes')
          .where('title', isGreaterThanOrEqualTo: query)
          .get();
      return snapshot.docs
          .map((doc) => NoteModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
