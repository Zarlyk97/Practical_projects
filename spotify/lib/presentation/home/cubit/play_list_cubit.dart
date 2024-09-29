import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/service_locator.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayListSongs() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();
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
