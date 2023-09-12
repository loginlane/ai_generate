import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
    SplashScreen({super.key});

    SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.theamColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height/2.8),
            Image.asset(AppImage.splashAi,height: height/5),
            SizedBox(height: height/50),
            SvgPicture.asset(AppImage.splashTxt),
            const Spacer(),
            Text("v 1.0",style: TextStyle(color: AppColor.whiteColor,fontSize: height/50),),
            SizedBox(height: height/15),
          ],
        ),
      ),
    );
  }
}
