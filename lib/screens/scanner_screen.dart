import 'package:flutter/material.dart';
import 'package:qrcode_in_webview/screens/webview_screen.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:qrscan/qrscan.dart' as scanner;

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();

}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {

    _scan();

    return Container();
  }

  Future _scan() async {
    String url = await scanner.scan();

    _openInWebview(url);
  }

  Future<Null> _openInWebview(String url) async {
    if (await url_launcher.canLaunch(url)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WebviewScreen(url)));
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("URL $url não pode ser aberta."),
        ),
      );
    }
  }
}
