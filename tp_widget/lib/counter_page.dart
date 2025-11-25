import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int _counter = 0;
  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conteur")),
      body: Center(
        child: Column(
          children: [
            Text("Counter : $_counter"),
            IconButton(
              onPressed: () => {
                setState(() {
                  _counter++;
                }),
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => {
                setState(() {
                  _counter--;
                }),
              },
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
