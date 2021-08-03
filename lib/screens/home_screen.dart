import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode_in_webview/screens/getxcontroller.dart';
import 'package:qrcode_in_webview/screens/home_controller.dart';
import 'package:qrcode_in_webview/utils/colors.dart';
import 'package:qrcode_in_webview/utils/styles.dart';
import 'package:qrcode_in_webview/utils/widget_utils.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

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
                      controller.textoBemvindo,
                      textAlign: TextAlign.center,
                      style: Styles.defaultTextStyle,
                    ),
                  ),
                  SizedBox(height: 50),
                  Image.asset(
                    MyGetXController.iconeAssetsPath,
                    width: 250.0,
                    height: 250.0,
                  ),
                  SizedBox(height: 50),
                  RaisedTextButton(controller.textoBtnIniciarInspecao,
                      controller.abrirTelaIniciarInspecao),
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
