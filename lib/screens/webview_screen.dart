import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:qrcode_in_webview/screens/welcome_screen.dart';
import 'package:qrcode_in_webview/utils/colors.dart';

class WebviewScreen extends StatefulWidget {

  String url;

  WebviewScreen(this.url);

  @override
  _WebviewScreenState createState() => _WebviewScreenState(this.url);
}

class _WebviewScreenState extends State<WebviewScreen> {

  String url;

  _WebviewScreenState(this.url);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      initialChild: Center(child: CircularProgressIndicator()),
      url: url,
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: ColorUtils.branco_texto),
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  ModalRoute.withName('screens/QRCodeScreen'))),
          backgroundColor: ColorUtils.azul_escuro,
          centerTitle: true,
          title: Text(
            "Scan Task",
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorUtils.branco_texto, fontSize: 20.0),
          )),
    );
  }
}
