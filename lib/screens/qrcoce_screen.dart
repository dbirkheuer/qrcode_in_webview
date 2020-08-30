import 'package:flutter/material.dart';
//import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:qrcode_in_webview/utils/colors.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
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

  Future<String> _barcodeString;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('QRCode Reader Example'),
      ),
      body: new Center(
          child: new FutureBuilder<String>(
              future: _barcodeString,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return new Text(snapshot.data != null ? snapshot.data : '');
              })),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            _barcodeString = new QRCodeReader()
                .setAutoFocusIntervalInMs(200)
                .setForceAutoFocus(true)
                .setTorchEnabled(true)
                .setHandlePermissions(true)
                .setExecuteAfterPermissionGranted(true)
                .scan();
          });
        },
        tooltip: 'Reader the QRCode',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}
