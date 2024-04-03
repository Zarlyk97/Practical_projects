import 'package:flutter/material.dart';
import 'package:w_sharme_beauty_test/features/auth/presentation/widgets/text_form_input_widget.dart';
import 'package:w_sharme_beauty_test/features/main/presentation/widgets/list_style_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedButtonIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Чат',
          style:
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Column(
          children: [
            const TextFormInputWidget(
              prefixIcon: Icon(Icons.search),
              labelText: 'Поиск',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 35,
                  width: 170,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: buildButton(0, "Чат")),
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 170,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: buildButton(1, "Чат сообществ")),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            selectedButtonIndex == 0
                ? Expanded(
                    child: ListView.separated(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return ListStileWidget(theme: theme);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return ListStileWidget(theme: theme);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(int index, String text) {
    final theme = Theme.of(context);
    bool isSelected = selectedButtonIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButtonIndex = index;
        });
      },
      child: Container(
        height: 35,
        width: 170,
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
