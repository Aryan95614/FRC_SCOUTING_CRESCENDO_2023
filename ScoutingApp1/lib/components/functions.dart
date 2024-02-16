import 'dart:collection';

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
  bool showQRCode = false;

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
    "times_they_were_amped": 0,

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
    "trap": false,
    "trap_miss": 0,
    "ChainFalling": false,
    "Harmonizing_Two_Robots": false,
    "Harmonizing_Three_Robots": false,
    "notes": "",

    "fouls": 0,
    "cards": 0,
  };

  static const double widthSeparation = 5.0;
  static const double verticalSeparation = 20.0;
  String totalString = "";

  void resetDataclass() {
    data = {
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
      "times_they_were_amped": 0,

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
      "trap": false,
      "trap_miss": 0,
      "ChainFalling": false,
      "Harmonizing_Two_Robots": false,
      "Harmonizing_Three_Robots": false,
      "notes": "",

      "fouls": 0,
      "cards": 0,
    };
  }
}

class Functions {
  // Initialize new Dataclass
  static Dataclass dataclass = Dataclass();
  static String totalString = "";

  static Set<String> queue = {};

  //bool showQRCode = false;
  static void addToImageSet(String data) {
    Functions.queue.add(data);
  }

  void restartDataclass() => dataclass.resetDataclass();

  static SizedBox widthSpacing() => const SizedBox(
        width: Dataclass.widthSeparation,
      );

  static SizedBox verticalSpacing() => const SizedBox(
        height: Dataclass.verticalSeparation,
      );

  static void addToTotalString(List<String> variables) {
    for (String variable in variables) {
      if (dataclass.data[variable] == "") {
        dataclass.data[variable] = "0";
      }
      totalString = "${totalString + dataclass.data[variable].toString()}, ";
    }
  }

  static String returnTotalDataclass() {
    // Team Name
    addToTotalString(<String>[
      // Pregame
      "team_name",
      "match_number",
      "color",

      // Auto
      "moved_during_auto",
      "speaker_note_score",
      "speaker_note_auto_missed",
      "amp_note_score",
      "amp_note_auto_missed",

      // Teleop
      "speaker_note_teleop",
      "speaker_note_missed",
      "amp_note_teleop",
      "amp_note_missed",
      "times_they_were_amped",

      "coop",
      "broken",
      "recouver",

      // Endgame
      "climb",
      "ChainFalling",
      "trap",
      "trap_miss"

      /* TODO: harmonize (0:0, 1:1, 2:2), foul*/
    ]);

    dynamic harmonize = 0;
    //Harmonizing_Three_Robots
    if (Functions.dataclass.data["Harmonizing_Two_Robots"]) {
      harmonize = 1;
    }
    if (Functions.dataclass.data["Harmonizing_Three_Robots"]) {
      harmonize = 2;
    }
    totalString = "$totalString${harmonize.toString()}, ";

    // add fouls points to other team
    addToTotalString(["fouls", "cards", "notes", "person_name"]);

    totalString += "~";
    String returnString = totalString;
    //dataclass.resetDataclass();
    totalString = "";

    print(returnString);
    return returnString;
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
            Navigator.pushNamed(context, possibleRoutes[route + 1]!);
          },
          icon: const Icon(Icons.arrow_forward_outlined))
    ],
  );
}
