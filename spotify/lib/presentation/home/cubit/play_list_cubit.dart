import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/service_locator.dart';

import '../../../domain/usecases/song/get_new_songs.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewSongsUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(
          PlayListFailure(),
        );
      },
      (data) {
        emit(
          PlayListLoaded(songs: data),
        );
      },
    );
  }
}
