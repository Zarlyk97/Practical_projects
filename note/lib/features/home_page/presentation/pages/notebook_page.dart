import 'package:firebase_auth_cubit/features/home_page/domain/models/note_model.dart';
import 'package:firebase_auth_cubit/features/home_page/presentation/cubit/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

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
              // Формадагы тексттерди сактап алуу
              final title = _titleController.text;
              final description = _descriptionController.text;

              // Firestore'го маалымат кошуу
              context.read<NoteCubit>().addNote(NoteModel(
                    id: const Uuid().v4(),
                    title: title,
                    content: description,
                  ));

              // Маалымат сакталгандан кийин билдирүү көрсөтүү
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Успешно отправлено!"),
                ),
              );

              // Полелерди тазалоо
              _titleController.clear();
              _descriptionController.clear();
            }
          }),
    );
  }
}
