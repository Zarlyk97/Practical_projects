import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/domain/entities/song/song.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      upDateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }
  void upDateSongPlayer() {
    emit(SongPlayerLoaded());
  }

  Future<void> loadPlaylistFromFirebase(List<SongEntity> songUrls) async {
    try {
      List<AudioSource> audioSources = songUrls.map((url) {
        return AudioSource.uri(Uri.parse(url.songId));
      }).toList();

      AudioSource playlist = ConcatenatingAudioSource(children: audioSources);
      await audioPlayer.setAudioSource(playlist);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  Future<void> loadSong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }

  void previousSong() {
    if (audioPlayer.hasPrevious) {
      audioPlayer.seekToPrevious();
      emit(SongPlayerLoaded());
    } else {
      audioPlayer.seek(
          Duration.zero); // Мурунку ыр жок болсо, учурдагыны башынан ойнотот.
      emit(SongPlayerLoaded());
    }
  }

  void nextSong() {
    if (audioPlayer.hasNext) {
      audioPlayer.seekToNext();
      emit(SongPlayerLoaded());
    } else {
      audioPlayer.seek(
          Duration.zero); // Кийинки ыр жок болсо, учурдагыны башынан ойнотот.
      emit(SongPlayerLoaded());
    }
  }
}
