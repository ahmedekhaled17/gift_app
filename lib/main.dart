import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/bindings/intial_bindings.dart';
import 'package:graduation_project/core/localization/change_local.dart';
import 'package:graduation_project/routes.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  HttpOverrides.global = MyHttpOverrides();
  runApp( const GiftApp());

}

class GiftApp extends StatelessWidget {
  const GiftApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(

      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'GiftHub',
      locale: controller.language,
      theme:controller.appThem,
      //home:const SplashScreen(),
      //routes:routes ,
      initialBinding:InitialBindings() ,
      getPages: routes,
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=>true;
    }
}
