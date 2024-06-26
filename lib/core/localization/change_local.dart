import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_them.dart';
import '../functions/fcmconfig.dart';
import '../services/services.dart';
class LocaleController extends GetxController {

  Locale? language ;

  MyServices myServices = Get.find() ;

  ThemeData appThem = themEnglish;


  changeLang(String langcode){
    Locale locale = Locale(langcode) ;
    myServices.sharedPreferences.setString("lang", langcode) ;
    appThem =langcode == "ar" ? themArabic : themEnglish ;
    Get.changeTheme(appThem);
    Get.updateLocale(locale) ;
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification() ;
    fcmconfig();
    requestPerLocation();

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang") ;
    if (sharedPrefLang == "ar"){
      language = const Locale("ar")  ;
      appThem  = themArabic;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en")  ;
      appThem = themEnglish;
    }else {
      language = Locale(Get.deviceLocale!.languageCode) ;
      appThem = themEnglish;
    }
    super.onInit();
  }
}
