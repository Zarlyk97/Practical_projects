import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Calculator',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text(""),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text(''),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text(''),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
