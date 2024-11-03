part of 'favorite_button_cubit.dart';

@immutable
abstract class FavoriteButtonState {}

class FavoriteButtonInitial extends FavoriteButtonState {}

final class FavoriteButtonUpdated extends FavoriteButtonState {
  final bool isFavorite;
  FavoriteButtonUpdated({required this.isFavorite});
}
