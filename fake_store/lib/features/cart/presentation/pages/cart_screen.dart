import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Корзина',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
              onPressed: () async {},
              child: const Text(
                'Очистить',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://img.freepik.com/free-photo/fun-backpacker-german-shepherd-dog-cartoon-character_183364-80975.jpg',
                                height: 86,
                                width: 86,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 50,
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '222',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'цена  с за шт',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '222 с',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        '222 с',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 7,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.list(children: [
            texts('Сумму', '222 с'),
            const SizedBox(
              height: 8,
            ),
            texts('Доставка', '150 c'),
            const SizedBox(
              height: 8,
            ),
            texts('Итого', '547 c'),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              child: const Text('Оформить заказ'),
            ),
          ]),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        )
      ],
    ));
  }
}

Widget texts(String text, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: const TextStyle(
          color: Color(0xFFABABAD),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        price,
        style: const TextStyle(
          color: Color(0xFF1E1E1E),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}
