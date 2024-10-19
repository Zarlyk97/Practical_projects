import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/profile/cubit/favorite_songs_cubit.dart';
import 'package:spotify/presentation/profile/cubit/profile_info_cubit.dart';
import 'package:spotify/presentation/song_player/pages/song_player_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        backgroundColor: AppColors.darkGrey,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _profileInfo(context),
          SizedBox(height: 30),
          _favoriteSongs()
        ]),
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3.5,
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.darkGrey
              : AppColors.lightBackground,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileInfoLoaded) {
              return Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          state.userEntity.imageUrl!,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(state.userEntity.email!),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.userEntity.fullName!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }
            if (state is ProfileInfoFailure) {
              return const Text('Please try again');
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _favoriteSongs() {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FAVORITE SONGS',
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
                builder: (context, state) {
                  if (state is FavoriteSongsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FavoriteSongsLoaded) {
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongPlayerPage(
                                      songEntity: state.favoriteSongs[index],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${AppUrls.coverfireStorageUrl}${state.favoriteSongs[index].artist.trim()} - ${state.favoriteSongs[index].title.trim()}.jpg?${AppUrls.mediaAlt}'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.favoriteSongs[index].title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      const SizedBox(height: 5),
                                      Text(state.favoriteSongs[index].artist,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        state.favoriteSongs[index].duration
                                            .toString()
                                            .replaceAll('.', ':'),
                                      ),
                                      SizedBox(width: 15),
                                      FavoriteButton(
                                        songEntity: state.favoriteSongs[index],
                                        key: UniqueKey(),
                                        function: () {
                                          context
                                              .read<FavoriteSongsCubit>()
                                              .removeSong(index);
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: state.favoriteSongs.length);
                  }
                  if (state is FavoriteSongsFailure) {
                    return const Text('Please try again');
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
