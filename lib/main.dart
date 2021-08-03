import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:qrcode_in_webview/screens/home_screen.dart';
import 'package:qrcode_in_webview/screens/inspecao_retorno_screen.dart';
import 'package:qrcode_in_webview/screens/inspecao_screen.dart';
import 'package:qrcode_in_webview/utils/binds.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  {
    runApp(GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Colors.white)),
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      locale: Locale('pt', 'BR'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/screens/home_screen',
      getPages: [
        GetPage(
            name: '/screens/home_screen',
            page: () => HomeScreen(),
            binding: AllBinds()),
        GetPage(
            name: '/screens/inspecao_screen',
            page: () => InspecaoScreen(),
            binding: AllBinds()),
        GetPage(
            name: '/screens/inspecao_retorno_screen',
            page: () => InspecaoRetornoScreen(),
            binding: AllBinds()),
      ],
    ));
  }
}
