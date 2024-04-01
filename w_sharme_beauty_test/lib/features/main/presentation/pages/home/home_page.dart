import 'package:flutter/material.dart';
import 'package:w_sharme_beauty_test/features/main/presentation/widgets/widgets.dart';

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
          Image.asset('assets/png/chat.png'),
          const SizedBox(width: 10),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.separated(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            .copyWith(
                                                color: theme.disabledColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              CustomButton(theme: theme)
                            ],
                          ),
                          const SizedBox(height: 10),
                          index % 2 == 0
                              ? const Text(
                                  'Нет ничего более удивительного, чем мастерство маникюриста, который обладает умением превратить обычные ногти в истинные произведения искусства. Моя цель - не просто ухаживать за ногтями, но и придавать им индивидуальность, отражающую ваш стиль и характер.',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Мастер Маникюр',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.network(
                                        'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTAxL3Jhd3BpeGVsb2ZmaWNlMTJfcGhvdG9fb2ZfeW91bmdfaW5kaWFuX2dpcmxfaG9sZGluZ19zdHVkZW50X2JhY19hNDdmMzk1OS0zZDAyLTRiZWEtYTEzOS1lYzI0ZjdhNjEwZGEucG5n.png'),
                                  ],
                                ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const ContainerWidget(
                                text: '221',
                                widget: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ContainerWidget(
                                widget: Image.asset(
                                  'assets/png/comments.png',
                                  // ignore: deprecated_member_use
                                  color: Colors.grey,
                                ),
                                text: '45',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ContainerWidget(
                                text: '6',
                                widget: Image.asset(
                                  'assets/png/share.png',
                                  // ignore: deprecated_member_use
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10),
      ),
    );
  }
}
