import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Homework Provider',
          style: TextStyle(color: light ? Colors.red : Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 10),
              child: Container(
                  height: 200,
                  width: 200,
                  color: light ? Colors.green : Colors.pink),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoSwitch(
              value: light,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  const Duration(seconds: 10);
                  light = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
