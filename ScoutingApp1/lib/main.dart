import 'package:flutter/material.dart';
import 'package:scoutingapp1/QRCodeScanner/ScanningPage.dart';
import './components/functions.dart';
import './pages/Pregame.dart';
import './pages/Auto.dart';
import './pages/EndGame.dart';
import './pages/Teleop.dart';
import './pages/PostGame.dart';
import './QRCodeScanner/ScanningNavigationPage.dart';

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
        "MainPage": (context) => const MyHomePage(title: "Scouting App"),
        "PreGamePage": (context) => const Pregame(title: 'Before the Game'),
        "AutoPage": (context) => const AutoPage(
              title: "Autonomous Period",
            ),
        "TeleopPage": (context) => const TeleopPage(
              title: "Teleop Period",
            ),
        "EndGamePage": (context) => const EndGame(title: "EndGame Period"),
        "PostGamePage": (context) =>
            const PostGamePage(title: "PostGame Period"),
        "/Scanner1": (context) => const ScanningPage(title: "Scan Page"),
        "/ScanNav": (context) => const scanPage(title: "Scan Page")
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
                Functions.verticalSpacing(),
                FloatingActionButton.extended(
                  heroTag: 'Go to the Auto Page',
                  onPressed: () => showPage("PreGamePage", context),
                  label: const Text("Start Scouting"),
                ),
                Functions.verticalSpacing(),
                FloatingActionButton.extended(
                    heroTag: 'Scan the QRCode',
                    onPressed: () => showPage("/ScanNav", context),
                    label: const Text("Scan QR Code"))
              ],
            ),
          ),
        ));
  }
}
