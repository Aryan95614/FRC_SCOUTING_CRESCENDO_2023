import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../pages/sample.dart';

class Dataclass {
  Map<String, dynamic> data = {
    "team_name": "",
    "match_number": 0,

    // Auto

    "speaker_note_score": 0,
    "amp_note_score": 0
  };

  static const double? WidthSeperation = 5.0;

  void resetDataclass() {}
}

class Functions {
  // Initialize new Dataclass
  static Dataclass dataclass = Dataclass();

  void restartDataclass() => dataclass.resetDataclass();

  static SizedBox WidthSpacing() => const SizedBox(
        width: Dataclass.WidthSeperation,
      );
}

void showPage(String PageName, BuildContext context) {
  Navigator.pushNamed(context, PageName);
}

class AddOrMinus extends StatefulWidget {
  AddOrMinus({Key? key, required this.value, required this.description})
      : super(key: key);

  String value;
  String description;

  @override
  _AddOrMinusState createState() => _AddOrMinusState();
}

class _AddOrMinusState extends State<AddOrMinus> {
  @override
  Widget build(BuildContext context) {
    return CoolButton(widget.value, widget.description);
  }

  Row CoolButton(String Value, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton.small(
            onPressed: () {
              setState(() {
                if (Functions.dataclass.data[widget.value] > 0) {
                  Functions.dataclass.data[widget.value] -= 1;
                }
              });
            },
            child: const Text(
              "-",
            )),

        // Adding some space
        Functions.WidthSpacing(),

        // Icon to show information
        Text('${Functions.dataclass.data[widget.value]}'),

        // Adding some space
        Functions.WidthSpacing(),

        FloatingActionButton.small(
            onPressed: () {
              setState(() {
                if (Functions.dataclass.data[widget.value] < 50) {
                  Functions.dataclass.data[widget.value] += 1;
                }
              });
            },
            child: const Text(
              "+",
            )),
      ],
    );
  }
}
