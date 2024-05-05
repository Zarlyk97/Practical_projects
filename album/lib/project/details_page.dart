import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Товар',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
        child: SafeArea(
          child: Column(
            children: [
              ///////// Поиск товаров
              TextFormField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(
                    maxHeight: 46,
                  ),
                  filled: true,
                  fillColor: const Color(0xffF8F8F8),
                  hintText: 'Быстрый поиск',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 38,

                ////////  Выбрать ассортимент
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == index
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: currentIndex == index
                                      ? Colors.white
                                      : Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                            child: Text(
                              'assortment $index',
                              style: TextStyle(
                                color: currentIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: 5),
              ),
              const SizedBox(
                height: 20,
              ),

              ///////////  Выбрать товар
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 245,
                    crossAxisCount: 2,
                    mainAxisSpacing: 11.0,
                    crossAxisSpacing: 11.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://img.freepik.com/free-photo/fun-backpacker-german-shepherd-dog-cartoon-character_183364-80975.jpg',
                                  fit: BoxFit.cover,
                                  height: 96,
                                  width: 158,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'Text',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Цена с',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'В корзину',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
