import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/AddOrMinus.dart';
import 'package:scoutingapp1/components/functions.dart';
import 'package:scoutingapp1/components/Checkbox.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  AddOrMinus speakerNoteCollection =
      AddOrMinus(value: "speaker_note_score", description: "Speaker Shots?: ");
  AddOrMinus ampNoteCollection =
      AddOrMinus(value: "amp_note_score", description: "Amp Shots?: ");
  checkbox moved =
      checkbox(value: "moved_during_auto", description: "Moved During Auto?: ");

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
              speakerNoteCollection,
              Functions.verticalSpacing(),

              // Amp Note Score ( + - )
              ampNoteCollection,
              Functions.verticalSpacing(),

              // Has the robot moved ( CheckBox )
              moved,
              Functions.verticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
