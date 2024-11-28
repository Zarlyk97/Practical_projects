import 'package:firebase_auth_cubit/features/home_page/presentation/cubit/note_cubit.dart';
import 'package:firebase_auth_cubit/features/home_page/presentation/pages/notebook_page.dart';
import 'package:firebase_auth_cubit/features/home_page/presentation/widgets/notes_search_delegate.dart';
import 'package:firebase_auth_cubit/features/user_profile/cubit/upload_user_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_profile/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteCubit>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BlocBuilder<UploadUserImageCubit, UploadUserImageState>(
        builder: (context, state) {
          if (state is UpdateNoteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UploadUserImageSuccess) {
            return Drawer(
              backgroundColor: Colors.blue[700],
              child: ListView(children: [
                DrawerHeader(
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfilePage(),
                                  ));
                            },
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/5987/5987424.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${state.user!.displayName}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.user!.email.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ])),
                ListTile(
                  leading: const Icon(Icons.note_add, color: Colors.white),
                  title: const Text(
                    'Мои заметки',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Меню жабылат
                  },
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text('Настройки',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode, color: Colors.white),
                  title: const Text('Темная тема',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                )
              ]),
            );
          } else if (state is UploadUserImageFailure) {
            return const Center(
              child: Text('Error'),
            );
          }

          return const Center(
            child: Text('Error'),
          );
        },
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[700],
        automaticallyImplyLeading: true,
        title: const Text(
          "Мои заметки",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: NotesSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is GetNotesLoading || state is DeleteNoteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetNotesLoaded) {
            return Column(
              children: [
                TextFormField(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NoteBookPage()));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue[700],
                        child: const Icon(Icons.create_outlined,
                            color: Colors.white),
                      ),
                      title: Text(
                        state.notes[index].title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.notes[index].content.toString()),
                          Text(
                              "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}  ${DateTime.now().hour}:${DateTime.now().minute}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          context
                              .read<NoteCubit>()
                              .deleteNote(state.notes[index]);
                        },
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    itemCount: state.notes.length,
                  ),
                ),
              ],
            );
          } else if (state is GetNotesError) {
            return const Center(child: Text('Error'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteBookPage(),
            ),
          );
        },
      ),
    );
  }
}
