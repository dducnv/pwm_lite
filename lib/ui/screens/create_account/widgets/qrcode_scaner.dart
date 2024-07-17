import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cyber_safe/core/services.dart';
import 'package:cyber_safe/core/utils/logger.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrcodeScaner extends StatefulWidget {
  const QrcodeScaner({super.key});

  @override
  State<QrcodeScaner> createState() => _QrcodeScanerState();
}

class _QrcodeScanerState extends State<QrcodeScaner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    int countScan = 0;
    void onQRViewCreated({
      required QRViewController controller,
    }) {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
        });

        customLogger(msg: "${result!.code}", typeLogger: TypeLogger.info);
        customLogger(
            msg: "${OTPCustom.fromUri(result!.code!).toJson()}",
            typeLogger: TypeLogger.info);

        countScan++;

        if (countScan == 1) {
          Navigator.pop(context, result!.code);
        }

        // Navigator.pop(context, OTPCustom.fromUri(result!.code!).toJson());
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Scan QR Code'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blue,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
              onQRViewCreated: (controller) => {
                onQRViewCreated(
                  controller: controller,
                )
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
