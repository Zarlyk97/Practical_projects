part of 'favorite_songs_cubit.dart';

@immutable
sealed class FavoriteSongsState {}

final class FavoriteSongsInitial extends FavoriteSongsState {}

final class FavoriteSongsLoading extends FavoriteSongsState {}

final class FavoriteSongsLoaded extends FavoriteSongsState {
  final List<SongEntity> favoriteSongs;
  FavoriteSongsLoaded({required this.favoriteSongs});
}

final class FavoriteSongsFailure extends FavoriteSongsState {}
