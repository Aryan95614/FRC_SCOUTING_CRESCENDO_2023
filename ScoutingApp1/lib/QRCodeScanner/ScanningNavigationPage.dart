import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/functions.dart';

class scanPage extends StatefulWidget {
  const scanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<scanPage> createState() => _scanPageState();
}

class _scanPageState extends State<scanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showPage("/Scanner1", context);
                  },
                  child: const Text("Scan Another Code")),
              ElevatedButton(
                  onPressed: () {/*Todo: we have to just share it*/},
                  child: const Text("Send the Information")),
              ElevatedButton(
                  onPressed: () {
                    Functions.queue = {};
                  },
                  child: const Text("EmptyList")),
            ],
          ),
        ));
  }
}
