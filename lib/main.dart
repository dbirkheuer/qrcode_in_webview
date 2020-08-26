import 'package:flutter/material.dart';
import 'package:qrcode_in_webview/screens/welcome_screen.dart';
import 'package:qrcode_in_webview/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leitor QRCode',
      theme: ThemeData(
        accentColor: ColorUtils.azul_escuro
      ),
      home: WelcomeScreen(title: 'Leitor QRCode'),
    );
  }
}
