import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../widgets/custom_back_back_button.dart';

class ScanQRCodeScreen extends StatefulWidget {
  const ScanQRCodeScreen({super.key});

  @override
  State<ScanQRCodeScreen> createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  final qrViewKey = GlobalKey(debugLabel: "QRKey");
  QRViewController? qrViewController;
  Barcode? qrCode;

  @override
  void dispose() {
    // TODO: implement dispose
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      await qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                QRView(
                  key: qrViewKey,
                  overlay: QrScannerOverlayShape(
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                    borderWidth: 16,
                    borderLength: 16,
                    borderRadius: 16,
                  ),
                  onQRViewCreated: (QRViewController controller) {
                    setState(() {
                      qrViewController = controller;

                      qrViewController!.scannedDataStream.listen(
                        (codeScanned) => setState(
                          () {
                            qrCode = codeScanned;
                          },
                        ),
                      );
                    });
                  },
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Text(
                    qrCode != null
                        ? qrCode?.code ?? "Scan Code"
                        : "Please Scan Code",
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 20,
              left: 20,
              child: CustomBackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
