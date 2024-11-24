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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue[700],
                    child: const Icon(Icons.access_alarms, color: Colors.white),
                  ),
                  title: const Text(
                    "Прием у врача",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Не забудьте посещать врача"),
                      Text(
                          "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}  ${DateTime.now().hour}:${DateTime.now().minute}"),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
            itemCount: 30),
      ),
    );
  }
}
