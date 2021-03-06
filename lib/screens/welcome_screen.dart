import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qrcode_in_webview/screens/webview_dois.dart';
import 'package:qrcode_in_webview/screens/webview_screen.dart';
import 'package:qrcode_in_webview/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              "Olá, seja bem vindo!",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorUtils.branco_texto, fontSize: 28.0),
            ),
            SizedBox(height: 100),
            Image.asset(
              'assets/logo.png',
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 100),
            RaisedButton(
              textColor: ColorUtils.azul_escuro,
              color: ColorUtils.branco_texto,
              child: Text(
                "Iniciar inspeção",
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorUtils.azul_escuro, fontSize: 22.0),
              ),
              onPressed: () {
                _scanQR(context);
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
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

  Future _scanQR(BuildContext context) async {
    try {
      String qrResult = await BarcodeScanner.scan();

      setState(() {
        _openInWebview(context, qrResult);
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _showDialog("Você precisa permitir a utilização da câmera.");
        });
      } else {
        setState(() {
          _showDialog("Erro desconhecido. $ex");
        });
      }
    } on FormatException {} catch (ex) {
      setState(() {
        _showDialog("Erro desconhecido. $ex");
      });
    }
  }

  Future<Null> _openInWebview(BuildContext context, String url) async {
    if (await url_launcher.canLaunch(url)) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => WebviewState(url)));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyWebviewDois(url)));
    } else {
      _showDialog("A url $url não pode ser aberta");
    }
  }

  void _showDialog(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Opsss..."),
          content: new Text(mensagem),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
