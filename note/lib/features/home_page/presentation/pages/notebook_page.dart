import 'package:flutter/material.dart';

class NoteBookPage extends StatefulWidget {
  const NoteBookPage({super.key});

  @override
  State<NoteBookPage> createState() => _NoteBookPageState();
}

class _NoteBookPageState extends State<NoteBookPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[700],
        title: const Text(
          "Блокнот",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Text(
            '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Название",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: "Введите название",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Название обязательно";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Описание",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: "Введите описание",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Описание обязательно";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        child: const Icon(Icons.save, color: Colors.white),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Save data or perform desired action
            String title = _titleController.text;

            // For example, show a snackbar for success
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Сохранено: $title"),
              ),
            );

            // Clear fields after saving
            _titleController.clear();
            _descriptionController.clear();
          }
        },
      ),
    );
  }
}
