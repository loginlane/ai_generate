import 'dart:async';

import 'package:ai_generate/config/approute.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  var getToken;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTokenValue();
    Future.delayed(const Duration(seconds: 4),()=> getToken == null ? Get.offAllNamed(AppRoute.loginScreen) : Get.offAllNamed(AppRoute.bottomScreen));
  }
 getTokenValue() async {
   SharedPreferences pref = await SharedPreferences.getInstance();
   getToken = await pref.getString('Token');
   update();
 }
}