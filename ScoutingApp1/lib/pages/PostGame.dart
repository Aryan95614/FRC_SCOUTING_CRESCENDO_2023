import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/QrCode.dart';
import './Pregame.dart';
import 'package:scoutingapp1/components/AddOrMinus.dart';
import 'package:scoutingapp1/components/functions.dart';
import 'package:scoutingapp1/components/Checkbox.dart';

class PostGamePage extends StatefulWidget {
  const PostGamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PostGamePage> createState() => _PostGamePageState();
}

class _PostGamePageState extends State<PostGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            FloatingActionButton.extended(
                heroTag: 'Going to Starting page',
                onPressed: () {
                  Functions.totalString = "";
                  Functions.dataclass.showQRCode = false;
                  Functions.restartDataclass();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const Pregame(title: "Pregame Page")),
                      ModalRoute.withName('/'));
                },
                label: const Text("Redo Scouting")),
            Functions.verticalSpacing(),
            const QRCodeWidget(information: ""),
          ],
        ),
      )),
    );
  }
}
