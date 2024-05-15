import 'package:album/album/domain/models/album.model.dart';
import 'package:album/album/domain/repositories/album_repositry.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final AlbumRepository _albumRepository;
  AlbumCubit(this._albumRepository) : super(AlbumInitial());

  getAlbum() async {
    emit(AlbumLoading());
    try {
      final album = await _albumRepository.getAlbum();
      emit(AlbumLoaded(album));
    } catch (e) {
      emit(AlbumError(e.toString()));
    }
  }
}
