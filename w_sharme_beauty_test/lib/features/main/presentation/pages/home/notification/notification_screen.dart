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
                itemCount: 15,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 1.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      onTap: () {},
                      leading: const CircleAvatar(
                        radius: 25,
                        child: Text("A"),
                      ),
                      title: (Text(
                        "Elena Ivanovna",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      )),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Подписался(ась) на ваши обновления",
                            style: theme.textTheme.bodySmall!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "2-нед",
                            style: theme.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: CustomButtonWidget(theme: theme),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
