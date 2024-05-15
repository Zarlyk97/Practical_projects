import 'package:album/album/domain/models/album.model.dart';
import 'package:album/album/presentation/cubit/album_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AlbumModel> album = [];
  @override
  void initState() {
    context.read<AlbumCubit>().getAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is AlbumLoaded) {
            album = state.album;
          }
          return ListView.builder(
            itemCount: album.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      album[index].thumbnailUrl.toString(),
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Text(album[index].title.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
