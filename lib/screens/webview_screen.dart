import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/colors.dart';

class WebviewState extends StatefulWidget {
  String url;

  WebviewState(this.url);

  @override
  _WebviewStateState createState() => _WebviewStateState(this.url);
}

class _WebviewStateState extends State<WebviewState> {
  String url;
  bool isLoading = true;
  final _key = UniqueKey();

  _WebviewStateState(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ColorUtils.azul_escuro,
        title: Text("ScanTask"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: this.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
