import 'package:counter_app/models/temperatura_model.dart';
import 'package:counter_app/models/weeks_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = List<String>.generate(7, (i) => 'item $i');
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Weather Forecast',
            style: theme.textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.red),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              hintText: 'Enter city Name',
              hintStyle: theme.textTheme.bodyMedium,
            ),
          ),
          Text(
            "Murmansk Oblast, RU",
            style: theme.textTheme.displaySmall?.copyWith(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 35),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Friday, Mar, 20, 2020', style: theme.textTheme.titleMedium),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                    size: 70,
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    '14 °F',
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    'LIGHT SNOW',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 55,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '5',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'km/hr',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '3',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '%',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '20',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '%',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            '7-DAY WEATHER FORECAST ',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 75),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    width: 180,
                    color: const Color(0XFFE57373),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weeks(index + 1),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              temperatura(index + 1),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.wb_sunny,
                              color: Colors.white,
                              size: 35,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
