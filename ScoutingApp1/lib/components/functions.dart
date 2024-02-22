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
import 'package:csv/csv.dart';

class Dataclass {
  bool showQRCode = false;
  bool color = true;

  bool moved_during_auto = false;
  bool coop_bonus = false;

  bool harmonize_two = false;
  bool harmonize_three = false;

  bool climbed = false;
  bool traps = false;
  bool chainFalling = false;

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

  void resetDataclass() {
    showQRCode = false;
    moved_during_auto = false;
    coop_bonus = false;
    harmonize_two = false;
    harmonize_three = false;

    climbed = false;
    traps = false;
    chainFalling = false;
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

  static void restartDataclass() => dataclass.resetDataclass();

  static SizedBox widthSpacing() => const SizedBox(
        width: Dataclass.widthSeparation,
      );

  static SizedBox verticalSpacing() => const SizedBox(
        height: Dataclass.verticalSeparation,
      );

  static String returnPartString(String variable) {
    if (dataclass.data[variable] == 0) {
      dataclass.data[variable] = "0";
    }
    print(dataclass.data[variable]);

    return "${dataclass.data[variable]}, ";
  }

  static changeBool(bool variable) {
    if (variable) {
      return "1, ";
    } else {
      return "0, ";
    }
  }

  static String getStringReady() {
    String rawSpace = "";

    for (String element in queue) {
      rawSpace = rawSpace + element;
    }

    return rawSpace;
  }

  static String returnTotalDataclass() {
    String newString = "";

    newString += returnPartString("team_name");
    newString += returnPartString("match_number");

    newString += Functions.dataclass.color ? "1, " : "0, ";

    newString += changeBool(dataclass.moved_during_auto);
    newString += returnPartString("speaker_note_score");
    newString += returnPartString("speaker_note_auto_missed");
    newString += returnPartString("amp_note_score");
    newString += returnPartString("amp_note_auto_missed");

    newString += returnPartString("speaker_note_teleop");
    newString += returnPartString("speaker_note_missed");
    newString += returnPartString("amp_note_teleop");
    newString += returnPartString("amp_note_missed");
    newString += returnPartString("times_they_were_amped");

    newString += changeBool(dataclass.coop_bonus);
    newString += returnPartString("broken");
    newString += returnPartString("recouver");

    newString += changeBool(dataclass.climbed);
    newString += changeBool(dataclass.chainFalling);
    newString += changeBool(dataclass.traps);

    newString += returnPartString("trap_miss");

    if (Functions.dataclass.harmonize_two) {
      newString += "2, ";
    } else if (Functions.dataclass.harmonize_three) {
      newString += "1, ";
    }

    newString += returnPartString("fouls");
    newString += returnPartString("cards");
    newString += returnPartString("person_name");
    newString += returnPartString("notes");

    newString += "~";

    print(newString);
    return newString;
  }

  static void getFile(List<List<dynamic>> getInfos) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = File("$dir/filename1.csv");

    String csv = const ListToCsvConverter().convert(getInfos);
    f.writeAsString(csv);
    print("done");
  }
}

void showPage(String pageName, BuildContext context) {
  Navigator.pushNamed(context, pageName);
}
