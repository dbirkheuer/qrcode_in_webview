import 'package:flutter/material.dart';
import 'package:qrcode_in_webview/screens/getxcontroller.dart';
import 'package:qrcode_in_webview/utils/colors.dart';
import 'package:qrcode_in_webview/utils/styles.dart';

Widget RaisedTextButton(String texto, Function onPressedx) {
  RoundedRectangleBorder shapex = new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(30.0),
  );

  return ElevatedButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => ColorUtils.azul_escuro,
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        // background color    this is color:
        (Set<MaterialState> states) => ColorUtils.branco_texto,
      ),
      shape: MaterialStateProperty.all(shapex),
    ),
    onPressed: () {
      onPressedx.call();
    },
    child: Text(
      texto,
      textAlign: TextAlign.center,
      style: Styles.escritaEscuraMedia,
    ),
  );
}

Widget RaisedIconButton(IconData iconData, Function onPressedx) {
  RoundedRectangleBorder shapex = new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(30.0),
  );

  return ElevatedButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => ColorUtils.branco_texto,
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        // background color    this is color:
        (Set<MaterialState> states) => ColorUtils.azul_escuro,
      ),
      shape: MaterialStateProperty.all(shapex),
    ),
    onPressed: () {
      onPressedx.call();
    },
    child: Icon(iconData),
  );
}

Widget logotipoContainer() {
  return Container(
    padding: EdgeInsets.only(right: 20, bottom: 20),
    alignment: Alignment.bottomRight,
    child: Image.asset(
      MyGetXController.logotipoAssetsPath,
      height: 30,
    ),
  );
}
