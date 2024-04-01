import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
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
          Image.asset('assets/png/comment.png'),
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
                          const Text(
                            'Нет ничего более удивительного, чем мастерство маникюриста, который обладает умением превратить обычные ногти в истинные произведения искусства. Моя цель - не просто ухаживать за ногтями, но и придавать им индивидуальность, отражающую ваш стиль и характер.',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              ContainerWidget(
                                text: '221',
                                widget:
                                    SvgPicture.asset('assets/svg/share.svg'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ContainerWidget(
                                widget:
                                    SvgPicture.asset('assets/svg/comment.svg'),
                                text: '45',
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ContainerWidget(
                                text: '6',
                                widget: SvgPicture.asset(
                                  'assets/svg/comment.svg',
                                  color: theme.primaryColor,
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
