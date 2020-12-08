import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qrcode_in_webview/utils/colors.dart';

class MyWebviewDois extends StatefulWidget {
  String url;

  MyWebviewDois(this.url);

  @override
  State<StatefulWidget> createState() => _MyWebviewDoisState(this.url);
}

class _MyWebviewDoisState extends State<MyWebviewDois> {
  InAppWebViewController _webViewController;
  String url;
  double progress = 0;

  _MyWebviewDoisState(this.url);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          backgroundColor: ColorUtils.azul_escuro,
          title: Text("ScanTask"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorUtils.branco_texto),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorUtils.azul_escuro)),
                child: InAppWebView(
                  initialUrl: this.url,
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                    debuggingEnabled: true,
                  )),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  onLoadStart: (InAppWebViewController controller, String url) {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onLoadStop:
                      (InAppWebViewController controller, String url) async {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(0.0),
                child: progress < 1.0
                    ? LinearProgressIndicator(
                    backgroundColor: ColorUtils.branco_texto,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorUtils.azul_escuro),
                    value: progress)
                    : Container()),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  textColor: ColorUtils.branco_texto,
                  color: ColorUtils.azul_escuro,
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.goBack();
                    }
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                RaisedButton(
                  textColor: ColorUtils.branco_texto,
                  color: ColorUtils.azul_escuro,
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.goForward();
                    }
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                RaisedButton(
                  textColor: ColorUtils.branco_texto,
                  color: ColorUtils.azul_escuro,
                  child: Icon(Icons.refresh),
                  onPressed: () {
                    if (_webViewController != null) {
                      _webViewController.reload();
                    }
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                RaisedButton(
                  textColor: ColorUtils.branco_texto,
                  color: ColorUtils.azul_escuro,
                  child: Icon(Icons.copy),
                  onPressed: () {
                    FlutterClipboard.copy(this.url).then((value) =>
                        Fluttertoast.showToast(
                            msg: "Url copiada para o clipboard.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: ColorUtils.azul_escuro,
                            textColor: ColorUtils.branco_texto,
                            fontSize: 16.0));
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
