import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:qr_mobile_vision/qr_mobile_vision.dart';

import '../../theme/themes.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner(this.qrCodeCallback, {Key? key}) : super(key: key);

  final Function(String?) qrCodeCallback;

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  bool readed = false;

  @override
  Widget build(BuildContext context) {
    final squareSize = (MediaQuery.of(context).size.width * 9 / 10);
    return Scaffold(
      body: QrCamera(
        formats: const [BarcodeFormats.QR_CODE],
        qrCodeCallback: (value) {
          if (value != null && !readed) {
            readed = true;
            Get.back();
            widget.qrCodeCallback(value);
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                child: Container(
                    alignment: Alignment.center,
                    width: squareSize,
                    height: squareSize,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          spreadRadius: Get.height,
                          offset: Offset(Get.height + squareSize, 0),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          spreadRadius: Get.height,
                          offset: Offset(-(Get.height + squareSize), 0),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, squareSize),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, -squareSize),
                        ),
                      ],
                      color: Colors.transparent,
                    ),
                    child: Container(
                      width: double.maxFinite,
                      height: 1,
                      color: Colors.red,
                    )),
              ),
            ),
            Positioned.fill(
              bottom: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          TccColors.baseColor)),
                  onPressed: Get.back,
                  child: const Text('Cancelar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
