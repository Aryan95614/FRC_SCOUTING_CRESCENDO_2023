import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import './functions.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class QRCodeWidget extends StatefulWidget {
  const QRCodeWidget({Key? key, required this.information}) : super(key: key);

  //QRCode Information
  final String information;

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  ScreenshotController _screenshotController = ScreenshotController();
  var image;

  Future<void> _captureAndSaveQRCode() async {
    var appDocDir = (await getApplicationDocumentsDirectory()).path;
    final imagePath = await File('$appDocDir/captured.png').create();

    _screenshotController
        .captureFromWidget(
            Container(
              color: Colors.white,
              child: QrImageView(
                data: Functions.returnTotalDataclass(),
                version: QrVersions.auto,
                size: 200,
                gapless: false,
              ),
            ),
            delay: const Duration(seconds: 1))
        .then((value) async {
      image = value;

      await imagePath.writeAsBytes(image!);

      ///Share
      await Share.shareFiles([imagePath.path]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
                heroTag: "Showing QRCode",
                onPressed: () {
                  setState(() {
                    Functions.dataclass.showQRCode = true;
                  });
                },
                label: const Text("Show QRCode")),
            Visibility(
                visible: Functions.dataclass.showQRCode,
                child: Column(
                  children: [
                    Screenshot(
                      controller: _screenshotController,
                      child: QrImageView(
                        data: Functions.returnTotalDataclass(),
                        version: QrVersions.auto,
                        size: 200,
                        gapless: false,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _captureAndSaveQRCode();
                        },
                        child: const Text("Share Code"))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
//
/*
times amped,
 Climb fall trap Trap miss, harmonize Foul card
 */
