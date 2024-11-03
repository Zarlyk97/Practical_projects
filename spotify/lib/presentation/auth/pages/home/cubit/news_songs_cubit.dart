import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/service_locator.dart';

import '../../../../../domain/usecases/song/get_new_songs.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewSongsUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(
          NewsSongsFailure(),
        );
      },
      (data) {
        emit(
          NewsSongsLoaded(songs: data),
        );
      },
    );
  }
}
