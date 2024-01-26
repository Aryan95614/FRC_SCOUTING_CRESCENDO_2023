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
    "amp_note_score": 0,
    "moved_during_auto": false,

    // EndGame

    "climb": false,
    "trap": 0,
    "ChainFalling": false,
    "Harmonizing": "",
  };

  static const double widthSeparation = 5.0;
  static const double verticalSeparation = 5.0;

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
        width: Dataclass.verticalSeparation,
      );
}

void showPage(String pageName, BuildContext context) {
  Navigator.pushNamed(context, pageName);
}
