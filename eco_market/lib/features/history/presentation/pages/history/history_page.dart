import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/config/router/router.dart';
import 'package:eco_market/features/history/presentation/widgets/widgets.dart';
import 'package:eco_market/features/main/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'История заказов',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Сегодня'),
            Expanded(
              child: ListStyleWidget(
                onTap: () => bottomSheetHistory(context),
                leading: SizedBox(
                  width: 44,
                  height: 44,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColors.green),
                  ),
                ),
                title: 'Заказа №345674',
                subtitle: '12:46',
                trailing: '340 с',
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

///////////Bottom Sheet история
  bottomSheetHistory(BuildContext context) => showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        showDragHandle: true,
        backgroundColor: AppColors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) => StatefulBuilder(
          builder: (context, StateSetter setState) => SingleChildScrollView(
            child: Wrap(children: [
              SizedBox(
                width: double.infinity,
                height: 220,
                child: Column(
                  children: [
                    _text('Заказ №34354545'),
                    const SizedBox(
                      height: 4,
                    ),
                    Image.asset('assets/images/history/check.png'),
                    const SizedBox(
                      height: 12,
                    ),
                    _text('Оформлен 07.07.2023 12:46'),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      '396 c',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    _text('Доставка 150 с'),
                  ],
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                  child: Column(
                    children: [
                      for (int i = 1; i < 4; i++)
                        GestureDetector(
                          onTap: () => context.pushRoute(const OrderRoute()),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            height: 70,
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffF8F8F8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/search/apples_small.png'),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Яблоко золотая радуга',
                                              style: TextStyle(
                                                color: Color(0xFF1E1E1E),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                            ),
                                            const Text('56 с',
                                                style: TextStyle(
                                                  color: Color(0xFF75DB1B),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            _priceText('Цена 56 с за штук'),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.41,
                                            ),
                                            _priceText('1 шт')
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 42,
                      ),
                      CustomButtomWidget(
                        onPressed: () {
                          context.popRoute();
                        },
                        text: 'Закрыть',
                        height: 54,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _priceText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFD2D1D5),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
