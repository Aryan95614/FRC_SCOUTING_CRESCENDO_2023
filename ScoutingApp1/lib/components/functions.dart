import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Dataclass {



 //Pre game

    String name = "";
    String team_name = "";
    String team_number = "";
    String match_number = "";
    bool color = false;
    bool bogusshitdontcount = false;

    //Auto
    int speakerAuto = 0;
    int missedSpeakerAuto = 0;
    int ampAuto = 0;
    int missedAmpAuto = 0;
    bool moved = false;

    //TeleOp
    int speaker = 0;
    int missedSpeaker = 0;
    int amp = 0;
    int missedAmp = 0;
    bool coop_bonus = false;
    int breakdown = 0;
    int recovery = 0;

    //endgame
    bool climb = false;
    int trap = 0;
    bool fall = false;
    bool harmonize1 = false;
    bool harmonize2 = false;

    //Postgame
    int foul = 0;
    bool yellow_card = false;
    bool red_card = false;
    String robot_notes = '';

  resetDataclass() {}

}



class functions {
  // Initialize new Dataclass
  static Dataclass dataclass = Dataclass();

  void restartDataclass() => dataclass.resetDataclass();

}

void showPage(String PageName, BuildContext context) {
  Navigator.pushNamed(context, PageName);
}

String dataSent () {
    //Bools
    var color = functions.dataclass.color == true ? "1" : "0";
    var moved = functions.dataclass.moved == true ? "1" : "0";
    var coop_bonus = functions.dataclass.coop_bonus == true ? "1" : "0";
    var climb = functions.dataclass.climb == true ? "1" : "0";
    var fall = functions.dataclass.fall == true ? "1" : "0";
    var harmonize1 = functions.dataclass.harmonize1 == true ? "1" : "0";
    var harmonize2 = functions.dataclass.harmonize2 == true ? "1" : "0";
    var yellow_card = functions.dataclass.yellow_card == true ? "1" : "0";
    var red_card = functions.dataclass.red_card == true ? "1" : "0";

    //Pregame info
    String match_number = functions.dataclass.match_number = '';
    String team_number = functions.dataclass.team_number = '';
    String robot_notes = functions.dataclass.robot_notes = '';





    return dataSent();
}

