import 'dart:async';

import 'package:ai_generate/config/approute.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 4),()=>Get.offAllNamed(AppRoute.bottomScreen));
  }

}