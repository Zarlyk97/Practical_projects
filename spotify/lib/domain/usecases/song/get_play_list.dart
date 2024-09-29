import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecases/usecase.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/service_locator.dart';

class GetPlayListUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepositoryImple>().getPlayList();
  }
}
