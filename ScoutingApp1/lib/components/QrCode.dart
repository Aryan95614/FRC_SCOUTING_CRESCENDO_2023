import 'package:flutter/material.dart';

class QRCodeWidget extends StatefulWidget {
  const QRCodeWidget({Key? key, required this.information}) : super(key: key);

  //QRCode Information
  final String information;
  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Placeholder()],
        ),
      ),
    );
  }
}
