import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appfont.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.theamColor,
      appBar: AppBar(
        backgroundColor: AppColor.theamColor,
        leadingWidth: width / 5,
        elevation: 0,
        title: AutoSizeText("Settings",style: TextStyle(fontFamily: AppFont.metalManiaRegular,fontSize: 30,color: AppColor.textColor),),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: width / 40),
          child: Image.asset(AppImage.proTag),
        ),
        actions: [SizedBox(width: width / 40)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/40),
        child: Column(
          children: [
            SizedBox(height: height/40),
            Container(
              height: height/3.4,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(AppImage.profileBanner),fit: BoxFit.fill)
              ),
              child: Column(
                children: [
                  SizedBox(height: height/25),
                  AutoSizeText("Ai Avtar PRO" , style: TextStyle(color: AppColor.whiteColor,fontFamily: AppFont.metalManiaRegular,fontSize: 22),),
                  SizedBox(height: height/50),
                  AutoSizeText("developed by 318 AI\nspecialist,world-leading\nimage processing tech" ,textAlign: TextAlign.center, style: TextStyle(color: AppColor.whiteColor,fontSize: 15),),
                  SizedBox(height: height/50),
                  Container(
                    height: height/15,
                    width: width/2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      gradient: const LinearGradient(colors: [
                        Color(0xff15CEA9),
                        Color(0xffD75CD1),
                      ]),
                    ),
                    child: Center(
                      child: AutoSizeText("Try now",style: TextStyle(color: AppColor.whiteColor,fontSize: 17,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: height/150),
                  const AutoSizeText("\$3.33 /month" ,textAlign: TextAlign.center, style: TextStyle(color: Color(0xff858585),fontSize: 14),),
                ],
              ),
            ),
            SizedBox(height: height/30),
            settingStep(height: height,width: width,title: "My Profile",listIcon: AppImage.myProfile),
            SizedBox(height: height/50),
            settingStep(height: height,width: width,title: "Rate us",listIcon: AppImage.rateUs),
            SizedBox(height: height/50),
            settingStep(height: height,width: width,title: "Privacy agreement",listIcon: AppImage.privacyAgreement),
          ],
        ),
      ),
    );
  }
  Widget settingStep({height , width,title,listIcon}){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: width/20),
      child: Container(
        height: height/12,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.whiteColor),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            SizedBox(width: width/50),
            CircleAvatar(
              radius: height/30,
              backgroundColor: AppColor.whiteColor,
              child: Center(child: SvgPicture.asset(listIcon,height: height/40,)),
            ),
            SizedBox(width: width/25),
            AutoSizeText(title,style: TextStyle(fontSize: height/50,color: AppColor.whiteColor,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
