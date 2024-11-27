part of 'note_cubit.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

final class NoteInitial extends NoteState {}

// Notes
final class GetNotesLoading extends NoteState {}

final class GetNotesError extends NoteState {}

final class GetNotesLoaded extends NoteState {
  final List<NoteModel> notes;

  const GetNotesLoaded(List<dynamic> list, {required this.notes});
}

// Add note
final class AddNoteLoading extends NoteState {}

final class AddNoteError extends NoteState {}

final class AddNoteLoaded extends NoteState {}

// Update note
final class UpdateNoteLoading extends NoteState {}

final class UpdateNoteError extends NoteState {}

final class UpdateNoteLoaded extends NoteState {}

// Delete note
final class DeleteNoteLoading extends NoteState {}

final class DeleteNoteError extends NoteState {}

final class DeleteNoteLoaded extends NoteState {}
