import 'package:flutter/material.dart';
import 'package:qrcode_in_webview/screens/qrcoce_screen.dart';
import 'package:qrcode_in_webview/utils/colors.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCodeScreen()),
                );
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
