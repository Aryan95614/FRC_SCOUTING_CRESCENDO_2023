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
  Dataclass() {
    resetDataclass();
  }

  void resetDataclass() {
    String team_name = "";
    int match_number = 0;
  }
}

class functions {
  // Initialize new Dataclass
  static Dataclass dataclass = Dataclass();

  void restartDataclass() => dataclass.resetDataclass();
}

void showPage(String PageName, BuildContext context) {
  Navigator.pushNamed(context, PageName);
}
