import 'package:flutter/material.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> colorCodes = <int>[
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal list'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return PortraitMode(colorCodes: colorCodes);
          } else {
            return LandscapeMode(colorCodes: colorCodes);
          }
        },
      ),
    );
  }
}

class LandscapeMode extends StatelessWidget {
  final List<int> colorCodes;
  const LandscapeMode({
    Key? key,
    required this.colorCodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: colorCodes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 100,
              color: Colors.green[colorCodes[index]],
            );
          },
        ),
      ),
    );
  }
}

class PortraitMode extends StatelessWidget {
  final List<int> colorCodes;
  const PortraitMode({
    Key? key,
    required this.colorCodes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorCodes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              width: 100,
              color: Colors.red[colorCodes[index]],
            );
          },
        ),
      ),
    );
  }
}
