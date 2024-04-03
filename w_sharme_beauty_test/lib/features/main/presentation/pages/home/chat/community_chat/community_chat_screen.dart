import 'package:flutter/material.dart';
import 'package:w_sharme_beauty_test/features/auth/presentation/widgets/text_form_input_widget.dart';

class CommunityChatScreen extends StatefulWidget {
  const CommunityChatScreen({super.key});

  @override
  CommunityChatScreenState createState() => CommunityChatScreenState();
}

class CommunityChatScreenState extends State<CommunityChatScreen> {
  final List<Message> messages = [
    Message(sender: 'LeoManic', text: 'Привет, как дела?'),
    Message(
        sender: 'Manic2023',
        text: 'Привет, как дела? Что скажешь? Как на диетах?'),
    Message(sender: 'Tropikanka', text: 'Привет, как дела?'),
    Message(sender: 'Krasota', text: 'Привет, как дела?'),
    Message(sender: 'LeoManic', text: 'Привет, как дела?'),
    Message(sender: 'Tropikanka', text: 'Привет, как дела?'),
    Message(sender: 'ManicureNew', text: 'Привет, как дела?'),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Чат сообщества LeoManic',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text('25 участников',
                style: theme.textTheme.titleSmall!.copyWith(color: Colors.grey))
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    leading: CircleAvatar(
                      child: Text(messages[index].sender[0]),
                    ),
                    title: Text(messages[index].text),
                  );
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    )),
                const Expanded(
                  child: TextFormInputWidget(
                      labelText: 'Cообщение', obscureText: false),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: FloatingActionButton(
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}
