import 'package:get/get.dart';
import 'package:qrcode_in_webview/screens/getxcontroller.dart';
import 'package:qrcode_in_webview/screens/inspecao_screen.dart';

class HomeController extends MyGetXController {
  String textoBemvindo = 'Olá, seja bem vindo!';
  String textoBtnIniciarInspecao = 'Iniciar inspeção';

  void abrirTelaIniciarInspecao() {
    Get.offAll(() => InspecaoScreen());
  }
}
