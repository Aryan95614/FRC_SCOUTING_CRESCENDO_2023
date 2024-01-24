import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/functions.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  AddOrMinus speaker_note_collection =
      AddOrMinus(value: "speaker_note_score", description: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Speaker Note Score ( + - )
              speaker_note_collection,
              // Amp Note Score ( + - )

              // Has the robot moved ( CheckBox )
            ],
          ),
        ),
      ),
    );
  }
}
