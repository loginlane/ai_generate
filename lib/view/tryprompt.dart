import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/view/pro_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TryPrompt extends StatefulWidget {
  String image;
    TryPrompt({super.key,required this.image});

  @override
  State<TryPrompt> createState() => _TryPromptState();
}

class _TryPromptState extends State<TryPrompt> {

  TextEditingController promptController = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    promptController.text = "new mech in a futuristic style and wearinf and metal shining hat in his heat like an cowboy style but its an metal one";
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.theamColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height/2,
              width: width,
               decoration: BoxDecoration(
                 image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover)
               ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height/25),
                  Padding(
                    padding: EdgeInsets.only(left: width/40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          backgroundColor: AppColor.theamColor,radius: height/40,child: Center(
                        child: Icon(Icons.arrow_back,color: AppColor.whiteColor,size: height/40),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height/50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              child: Row(
                children: [
                  AutoSizeText("Style :",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold,fontSize: 17),),
                  const Spacer(),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(AppImage.crown,height: height/50),
                      AutoSizeText("SMA 1.0",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold,fontSize: 17),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height/60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              child: Row(
                children: [
                  AutoSizeText("Prompt :",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold,fontSize: 17),),
                  const Spacer(),
                  GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(ClipboardData(text: promptController.text ?? ""));
                        Fluttertoast.showToast(msg: "Copy Text Successfully");
                      },
                      child: SvgPicture.asset(AppImage.copy)),
                ],
              ),
            ),
            SizedBox(height: height/60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/30),
              child: DottedBorder(
                color: AppColor.whiteColor,
                borderType: BorderType.RRect,
                dashPattern: const [
                  5,5
                ],
                radius: const Radius.circular(20),
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/20),
                      child: TextFormField(
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: InputBorder.none
                        ),
                        controller: promptController,
                        style: TextStyle(color: AppColor.whiteColor),textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height/12),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProScreen(prompt: promptController.text??""),));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width/30),
                child: Container(
                  height: height/15,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(colors: [
                      Color(0xffFDE4BB),
                      Color(0xffD03E2B),
                    ])
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImage.promptDailomond),
                      SizedBox(width: width/25),
                      const AutoSizeText("Try this prompt with",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
