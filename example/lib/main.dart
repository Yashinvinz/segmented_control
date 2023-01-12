import 'package:flutter/material.dart';
import 'package:segmented_control/segmented_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Segmented Control'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _selectedSegment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SegmentedControl(
                segmentCount: 3,
                borderRadius: 30,
                borderColor: Colors.blueAccent,
                segmentColor: Colors.white,
                selectedSegmentColor: Colors.blue,
                textColor: Colors.blue,
                selectedTextColor: Colors.white,
                segmentText: const ['One', 'Two', 'Three'],
                onSelected: (val) {
                  setState(() {
                    _selectedSegment = val;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Selected Segmented Index',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              _selectedSegment.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
