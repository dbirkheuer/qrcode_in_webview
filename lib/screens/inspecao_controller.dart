import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode_in_webview/screens/getxcontroller.dart';
import 'package:qrcode_in_webview/screens/inspecao_retorno_screen.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class InspecaoController extends MyGetXController {
  String textoSuperior = 'Aponte a câmera para o código QR.';
  String textoInferior = 'As quatro pontas do código devem aparecer da tela de escaneamento.';

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void onLeituraFinalizada(QRViewController controller) async {
    this.controller = controller;
    this.controller!.scannedDataStream.listen((scanData) async {
      if (await url_launcher.canLaunch(scanData.code)) {
        this.controller!.pauseCamera();
        var result = await Get.to(() => InspecaoRetornoScreen(),
            arguments: [scanData.code]);
        this.controller!.resumeCamera();
      }
    }).onError((error) {
      exibirDilog("Erro desconhecido. $error");
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
