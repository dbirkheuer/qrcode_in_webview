import 'package:get/get.dart';
import 'package:qrcode_in_webview/screens/home_controller.dart';
import 'package:qrcode_in_webview/screens/inspecao_controller.dart';
import 'package:qrcode_in_webview/screens/inspecao_retorno_controller.dart';

class AllBinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<InspecaoController>(() => InspecaoController());
    Get.lazyPut<InspecaoRetornoController>(() => InspecaoRetornoController());
  }
}
