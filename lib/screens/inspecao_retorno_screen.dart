import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:qrcode_in_webview/screens/inspecao_retorno_controller.dart';
import 'package:qrcode_in_webview/utils/colors.dart';
import 'package:qrcode_in_webview/utils/styles.dart';
import 'package:qrcode_in_webview/utils/widget_utils.dart';

class InspecaoRetornoScreen extends GetView<InspecaoRetornoController> {
  @override
  Widget build(BuildContext context) {
    Get.put(InspecaoRetornoController());

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ColorUtils.azul_escuro,
        title: Text(
          "ScanTask",
          style: Styles.defaultTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorUtils.branco_texto),
          onPressed: () => Get.back(result: 'Sucesso'),
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
                initialUrlRequest: URLRequest(url: Uri.parse(controller.url)),
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions()),
                onWebViewCreated: (InAppWebViewController contr) {
                  controller.webViewController = contr;
                },
                onProgressChanged:
                    (InAppWebViewController contr, int progress) {
                  double prog = progress / 100;
                  controller.progress(prog);
                },
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(0.0),
              child: Obx(() => controller.progress() < 1.0
                  ? LinearProgressIndicator(
                      backgroundColor: ColorUtils.branco_texto,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(ColorUtils.azul_escuro),
                      value: controller.progress())
                  : Container())),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedIconButton(
                Icons.arrow_back,
                controller.voltar,
              ),
              RaisedIconButton(
                Icons.arrow_forward,
                controller.prosseguir,
              ),
              RaisedIconButton(
                Icons.refresh,
                controller.atualizar,
              ),
              RaisedIconButton(Icons.copy, controller.copiarParaClipboard),
            ],
          ),
        ]),
      ),
    );
  }
}
