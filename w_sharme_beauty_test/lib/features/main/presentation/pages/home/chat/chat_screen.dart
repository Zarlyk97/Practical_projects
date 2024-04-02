import 'package:flutter/material.dart';
import 'package:w_sharme_beauty_test/features/auth/presentation/widgets/text_form_input_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Чат",
            style: theme.textTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormInputWidget(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  labelText: "Поиск",
                  obscureText: false),
              Expanded(
                child: TabBar(tabs: [
                  Text("Входящие"),
                  Text("Исходящие"),
                ]),
              )
            ],
          ),
        ));
  }
}
