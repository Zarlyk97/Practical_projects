import 'package:album/features/album/data/models/album.model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AlbumModel? album;
  @override
  void initState() {
    album = AlbumModel.fromJson({});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: album == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 10,
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
                        album!.url ?? '',
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        left: 150,
                        child: Text('data $index',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
