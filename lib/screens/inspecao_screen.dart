import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode_in_webview/screens/inspecao_controller.dart';
import 'package:qrcode_in_webview/utils/colors.dart';
import 'package:qrcode_in_webview/utils/styles.dart';
import 'package:qrcode_in_webview/utils/widget_utils.dart';

class InspecaoScreen extends GetView<InspecaoController> {
  @override
  Widget build(BuildContext context) {
    Get.put(InspecaoController());

    return Scaffold(
      backgroundColor: ColorUtils.azul_escuro,
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    child: Text(
                      controller.textoSuperior,
                      textAlign: TextAlign.center,
                      style: Styles.defaultTextStyle,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 250,
                    width: 250,
                    child: QRView(
                      key: controller.qrKey,
                      onQRViewCreated: controller.onLeituraFinalizada,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 250,
                    child: Text(
                      controller.textoInferior,
                      textAlign: TextAlign.center,
                      style: Styles.escritaClaraPequena,
                    ),
                  ),
                ],
              ),
              logotipoContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
