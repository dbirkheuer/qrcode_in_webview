import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:qrcode_in_webview/utils/colors.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => new _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorUtils.azul_escuro,
          centerTitle: true,
          title: Text(
            "ST Scan Task",
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorUtils.branco_texto, fontSize: 20.0),
          )),
      body: WebviewScaffold(
        url: 'https://flutter.io',
      ),
    );
  }
}
