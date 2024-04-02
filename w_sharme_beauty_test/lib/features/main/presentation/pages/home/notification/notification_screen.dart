import 'package:flutter/material.dart';
import 'package:w_sharme_beauty_test/features/main/presentation/widgets/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFF),
      appBar: AppBar(
        title: Text(
          "Уведомления",
          style:
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
            child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ListView.separated(
              itemCount: 20,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 1.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ListStileWidget(theme: theme),
                );
              },
            ),
          ),
        )),
      ),
    );
  }
}
