import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/functions.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';

class scanPage extends StatefulWidget {
  const scanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<scanPage> createState() => _scanPageState();
}

class _scanPageState extends State<scanPage> {
  uploadOrShareEmail() async {
    List<String> splitted = Functions.getStringReady().split('~');
    late List<List<dynamic>> totall = [];
    for (String x in splitted) {
      List<String> row = x.split(', ');
      totall.add(row);
    }
    String dir =
        "${(await getApplicationDocumentsDirectory()).path}/filename1.csv";

    Functions.getFile(totall);
    Share.shareFiles([dir], text: 'Robotics Csv File');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/filename1.csv');
  }

  Future<int> deleteFile() async {
    try {
      final file = await _localFile;
      await file.delete();
    } catch (e) {
      return 0;
    } finally {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showPage("/Scanner1", context);
                  },
                  child: const Text("Scan Another Code")),
              ElevatedButton(
                  onPressed: () async {
                    uploadOrShareEmail();
                  },
                  child: const Text("Send the Information")),
              ElevatedButton(
                  onPressed: () async {
                    await uploadOrShareEmail();
                    await deleteFile();
                  },
                  child: const Text("EmptyList")),
            ],
          ),
        ));
  }
}
