import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFF),
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(child: Text("A")),
        ),
        title: Text(
          "Главная",
          style:
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: [
          Image.asset('assets/png/notification.png'),
          const SizedBox(width: 10),
          Image.asset('assets/png/comment.png'),
          const SizedBox(width: 10),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => SizedBox(
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  child: Text("A"),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Elena Ivanovna",
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "22-март в 10:00",
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(color: theme.disabledColor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                  backgroundColor: MaterialStateProperty.all(
                                      theme.primaryColor),
                                ),
                                onPressed: () {},
                                child: const Text("Подписаться",
                                    style: TextStyle(color: Colors.white)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 10),
    );
  }
}
