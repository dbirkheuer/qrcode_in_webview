import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:qrcode_in_webview/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  bool _camState = false;

  _qrCallback(String url) {
    setState(() {
      _camState = false;

      this._openInWebview(url);
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

  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => WebviewScaffold(
                initialChild: Center(child: CircularProgressIndicator()),
                url: url,
                appBar: AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: ColorUtils.branco_texto),
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRCodeScreen()),
                            ModalRoute.withName('screens/QRCodeScreen'))),
                    backgroundColor: ColorUtils.azul_escuro,
                    centerTitle: true,
                    title: Text(
                      "Scan Task",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorUtils.branco_texto, fontSize: 20.0),
                    )),
              )));
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("URL $url não pode ser aberta."),
        ),
      );
    }
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
            SizedBox(height: 10),
            Text(
              "Centralize o qrcode do equipamento para iniciar a inspeção!",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtils.branco_texto, fontSize: 28.0),
            ),
            _camState
                ? Center(
                    child: SizedBox(
                      height: 280,
                      width: 280,
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
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.only(bottom: 5.0, right: 20.0),
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/logo_branco.png',
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
