part of 'play_list_cubit.dart';

@immutable
abstract class PlayListState {}

final class PlayListLoading extends PlayListState {}

final class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;
  PlayListLoaded({required this.songs});
}

final class PlayListFailure extends PlayListState {}
