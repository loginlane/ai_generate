import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appfont.dart';
import 'package:ai_generate/config/custombutton.dart';
import 'package:ai_generate/view/texttoimage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProScreen extends StatefulWidget {
  String prompt;
    ProScreen({super.key,required this.prompt});

  @override
  State<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.theamColor,
      appBar: AppBar(
        backgroundColor: AppColor.theamColor,
        elevation: 0,
        title: Text(
          "Ai Avtar",
          style: TextStyle(fontFamily: AppFont.metalManiaRegular),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 15),
        child: Column(
          children: [
            SizedBox(height: height / 3.5),
            Row(
              children: [
                const Spacer(),
                AutoSizeText(
                  "Ai Avtar",
                  style: TextStyle(
                      fontFamily: AppFont.metalManiaRegular,
                      color: AppColor.whiteColor,
                      fontSize: 30),
                ),
              ],
            ),
            SizedBox(height: height/50),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: height/100),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: height/12,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: selectedIndex == index ? const Color(0xffAB50E2):AppColor.whiteColor,width: width/100),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: width/20),
                            AutoSizeText("Weekly",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold,fontSize: 16),),
                            const Spacer(),
                            AutoSizeText("\$49.00",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold,fontSize: 16),),
                            SizedBox(width: width/20),
                          ],
                        ),
                      ),
                    ),
                  );
                },),
            ),
            SizedBox(height: height/30),
            customButton(title: "Continue",onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TextToImage(prompt: widget.prompt),));
            },),
            SizedBox(height: height/50),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
                child: AutoSizeText("Cancel anytime",style: TextStyle(color: AppColor.whiteColor,fontSize: Get.height/50),))
          ],
        ),
      ),
    );
  }
}
