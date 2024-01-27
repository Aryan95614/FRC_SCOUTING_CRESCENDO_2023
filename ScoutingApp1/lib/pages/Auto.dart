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
  AddOrMinus speakerNoteMissingCollection = AddOrMinus(
      value: "speaker_note_auto_missed", description: "Speaker Misses?: ");

  AddOrMinus ampNoteCollection =
      AddOrMinus(value: "amp_note_score", description: "Amp Shots?: ");
  AddOrMinus ampNoteMissingCollection =
      AddOrMinus(value: "amp_note_auto_missed", description: "Amp Misses?: ");

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

              // Speaker Note Missing ( + - )
              speakerNoteMissingCollection,
              Functions.verticalSpacing(),

              // Amp Note Score ( + - )
              ampNoteCollection,
              Functions.verticalSpacing(),

              // amp Note Missing ( + - )
              ampNoteMissingCollection,
              Functions.verticalSpacing(),

              // Has the robot moved ( CheckBox )
              moved,
              Functions.verticalSpacing(),

              // Page Navigation
              backAndForthPages(context, 3),
            ],
          ),
        ),
      ),
    );
  }
}
