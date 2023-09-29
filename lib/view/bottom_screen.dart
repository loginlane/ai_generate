import 'dart:ui';

import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/controller/bottom_controller.dart';
import 'package:ai_generate/view/ai_catogory.dart';
import 'package:ai_generate/view/ai_data/aidata_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'profile/setting_screen.dart';

class BottomScreen extends StatefulWidget {
  BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  BottomController bottomController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.theamColor,
      body: Stack(
        children: [
          bottomController.b1 == "0" ? const AiCatogery() :  bottomController.b2 == "1" ? const AiDataScreen() : const SettingScreen(),
          Center(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  height: height / 12,
                  width: width / 1.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.bottombarColor,
                      borderRadius: BorderRadius.circular(60)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bottomController.b1 = "0";
                            bottomController.b2 = "";
                            bottomController.b3 = "";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: bottomController.b1 == "0"? const LinearGradient(
                                  colors: [
                                    Color(0xffda4ee6),
                                    Color(0xff7567f8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              ) : null
                          ),
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: height / 30,
                              child: SvgPicture.asset(
                                AppImage.bottombar1,
                                color: bottomController.b1 == "0"
                                    ? Colors.white
                                    : const Color(0xffFFD233),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bottomController.b2 = "1";
                            bottomController.b1 = "";
                            bottomController.b3 = "";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: bottomController.b2 == "1"? const LinearGradient(
                                  colors: [
                                    Color(0xffda4ee6),
                                    Color(0xff7567f8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              ) : null
                          ),
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: height / 30,
                              child: SvgPicture.asset(AppImage.bottombar2)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bottomController.b3 = "2";
                            bottomController.b1 = "";
                            bottomController.b2 = "";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: bottomController.b3 == "2"? const LinearGradient(
                                  colors: [
                                    Color(0xffda4ee6),
                                    Color(0xff7567f8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              ) : null
                          ),
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: height / 30,
                              child: SvgPicture.asset(
                                AppImage.bottombar3,
                                color: bottomController.b3 == "2"
                                    ? Colors.white
                                    : const Color(0xffFFD233),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height/17)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
