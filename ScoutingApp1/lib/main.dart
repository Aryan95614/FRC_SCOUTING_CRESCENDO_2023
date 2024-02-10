import 'package:flutter/material.dart';
import 'package:scoutingapp1/pages/ResultsPage.dart';
import 'package:scoutingapp1/pages/Teleop.dart';
import 'pages/Pregame.dart';
import 'pages/PostGame.dart';
import 'pages/Auto.dart';
import 'pages/EndGame.dart';
import 'QR Scanner/QRScanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FRC 4976 Scouting App'),
      routes: {
        '/Pregame': (context) => const PregamePage(title: 'Pregame'),
        '/Auto': (context) => const AutoGamePage(title: 'Auto'),
        "/Teleop": (context) => const TelePage(title: "Teleop"),
        "/PostGame": (context) => const PostPage(title: "PostGame"),
        "/EndGame": (context) => const EndGamePage(title: "EndGame"),
        '/ResultsPage': (context) => const ResultsPage(title: 'ResultsPage'),
        '/MyHomePage': (context) => const MyHomePage(title: 'MyHomePage'),
        '/QRScannerPage': (context) => const ScannerPage(title: 'ScannerPage')
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100,),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Pregame');

                  },
                  child: const Text("Start Scouting"),
                ),
                SizedBox(height: 15,),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/QRScannerPage');

                  },
                  child: const Text("QR Scanner"),
                ),
              ],
            ),
          ),
        ));
  }
}
