import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImple extends SongsRepository {
  @override
  Future<Either> getNewsSongs() {
    return sl<SongRepositoryImple>().getNewsSongs();
  }
}
