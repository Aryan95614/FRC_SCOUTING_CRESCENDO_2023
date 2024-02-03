import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import './functions.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class QRCodeWidget extends StatefulWidget {
  const QRCodeWidget({Key? key, required this.information}) : super(key: key);

  //QRCode Information
  final String information;

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  bool _isVisible = false;

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
                    _isVisible = true;
                  });
                },
                label: const Text("Show QRCode")),
            Visibility(
                visible: _isVisible,
                child: Screenshot(
                  controller: ScreenshotController(),
                  child: QrImageView(
                    data: Functions.returnTotalDataclass(widget.information),
                    version: QrVersions.auto,
                    size: 200,
                    gapless: false,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
