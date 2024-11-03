import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotify/service_locator.dart';

part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());
  void favoriteButtonUpdated(String songId) async {
    var resault = await sl<AddOrRemoveFavoriteUseCase>().call(params: songId);
    resault.fold(
      (l) {},
      (isFavorite) {
        emit(
          FavoriteButtonUpdated(isFavorite: isFavorite),
        );
      },
    );
  }
}
