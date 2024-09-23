part of 'news_songs_cubit.dart';

@immutable
abstract class NewsSongsState {}

final class NewsSongsLoading extends NewsSongsState {}

final class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}

final class NewsSongsFailure extends NewsSongsState {}
