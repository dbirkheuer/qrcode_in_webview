import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:qrcode_in_webview/screens/webview_screen.dart';
import 'package:qrcode_in_webview/utils/colors.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  bool _camState = false;

  _qrCallback(String url) {
    setState(() {
      _camState = false;

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => WebViewScreen(url)),
          ModalRoute.withName('screens/qrcode_screen'));
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.azul_escuro,
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              "Centralize o qrcode do equipamento para iniciar a inspeção!",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtils.branco_texto, fontSize: 25.0),
            ),
            _camState
                ? Center(
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: QRBarScannerCamera(
                        onError: (context, error) => Text(
                          error.toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                        qrCodeCallback: (url) {
                          _qrCallback(url);
                        },
                      ),
                    ),
                  )
                : Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

//String url = await scanner.scan();

// https://pub.dev/packages/fast_qr_reader_view
