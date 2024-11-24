import 'package:flutter/material.dart';

import '../../../user_profile/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        automaticallyImplyLeading: false,
        title: const Text("Мои Заметки",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ProfilePage();
                },
              ),
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/5987/5987424.png"),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                onTap: () {},
                title: const Text("Hello World"),
                subtitle: const Text("Hello World"),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 5),
    );
  }
}
