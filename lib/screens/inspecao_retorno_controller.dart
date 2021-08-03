import 'package:clipboard/clipboard.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qrcode_in_webview/utils/colors.dart';

class InspecaoRetornoController extends GetxController {
  InAppWebViewController? webViewController;

  String get url => Get.arguments[0];
  var progress = 0.0.obs;

  Future copiarParaClipboard() async {
    FlutterClipboard.copy(url).then((value) => Fluttertoast.showToast(
        msg: "Url copiada para o clipboard.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorUtils.azul_escuro,
        textColor: ColorUtils.branco_texto,
        fontSize: 16.0));
  }

  void voltar() {
    if (webViewController == null) return;

    webViewController!.goBack();
  }

  void prosseguir() {
    if (webViewController == null) return;

    webViewController!.goForward();
  }

  void atualizar() {
    if (webViewController == null) return;

    webViewController!.reload();
  }
}
