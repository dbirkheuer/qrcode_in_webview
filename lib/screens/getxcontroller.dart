import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGetXController extends GetxController {
  static const iconeAssetsPath = 'assets/logo.png';
  static const logotipoAssetsPath = 'assets/logo_branco.png';

  void exibirDilog(String mensagem) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Opsss..."),
          content: new Text(mensagem),
          actions: <Widget>[
            new TextButton(
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