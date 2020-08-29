import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:qrcode_in_webview/screens/qrcoce_screen.dart';
import 'package:qrcode_in_webview/utils/colors.dart';


class WebViewScreen extends StatefulWidget {
  String url;

  WebViewScreen(this.url) {}

  @override
  _WebViewScreenState createState() => new _WebViewScreenState(this.url);
}

class _WebViewScreenState extends State<WebViewScreen> {
  String url;

  _WebViewScreenState(this.url) {}

  Future<bool> _onBackPressed() {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => QRCodeScreen()),
        ModalRoute.withName('screens/WebViewScreen'));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: ColorUtils.branco_texto),
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => QRCodeScreen()),
                    ModalRoute.withName('screens/WebViewScreen'))),
            backgroundColor: ColorUtils.azul_escuro,
            centerTitle: true,
            title: Text(
              "ST Scan Task",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtils.branco_texto, fontSize: 20.0),
            )),
        body: InAppWebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
