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
    // Pregame
    "person_name": "",
    "team_name": "",
    "match_number": "",
    "color": false,

    // Auto

    "speaker_note_score": 0,
    "amp_note_score": 0,
    "speaker_note_auto_missed": 0,
    "amp_note_auto_missed": 0,

    "moved_during_auto": false,

    // Teleop

    "speaker_note_teleop": 0,
    "amp_note_teleop": 0,
    "speaker_note_missed": 0,
    "amp_note_missed": 0,

    "coop": false,

    "recouver": 0,
    "broken": 0,

    // EndGame

    "climb": false,
    "trap": 0,
    "ChainFalling": false,
    "Harmonizing_Two_Robots": false,
    "Harmonizing_Three_Robots": false,
  };

  static const double widthSeparation = 5.0;
  static const double verticalSeparation = 20.0;

  void resetDataclass() {}
}

class Functions {
  // Initialize new Dataclass
  static Dataclass dataclass = Dataclass();

  void restartDataclass() => dataclass.resetDataclass();

  static SizedBox widthSpacing() => const SizedBox(
        width: Dataclass.widthSeparation,
      );

  static SizedBox verticalSpacing() => const SizedBox(
        height: Dataclass.verticalSeparation,
      );

  static String returnTotalDataclass(String widgetInformation) {
    String totalString = "";

    // We get started with a new dataclass
    dataclass = Dataclass();

    return totalString;
  }
}

void showPage(String pageName, BuildContext context) {
  Navigator.pushNamed(context, pageName);
}

Row backAndForthPages(BuildContext context, int route) {
  Map<int, String> possibleRoutes = {
    1: "MainPage",
    2: "PreGamePage",
    3: "AutoPage",
    4: "TeleopPage",
    5: "EndGamePage",
    6: "PostGamePage",
  };

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, possibleRoutes[route - 1]!);
          },
          icon: const Icon(Icons.arrow_back_outlined)),
      Functions.widthSpacing(),
      IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, possibleRoutes[route + 1]!);
          },
          icon: const Icon(Icons.arrow_forward_outlined))
    ],
  );
}
