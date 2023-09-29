import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appfont.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/config/custombutton.dart';
import 'package:ai_generate/model/texttoimage_model.dart';
import 'package:ai_generate/services/apiservice.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextToImage extends StatefulWidget {
  String prompt;
  TextToImage({super.key,required this.prompt});

  @override
  State<TextToImage> createState() => _TextToImageState();
}

class _TextToImageState extends State<TextToImage> {

  TextEditingController promptController = TextEditingController();
  TextToImageModel? textToImageModel;
  bool isLoadPrompt = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageGenrate();
  }

  imageGenrate() async {
    setState(() {
      isLoadPrompt = true;
    });
    textToImageModel = await ApiServicesClass.textToImage(txt: widget.prompt);
    setState(() {});
    setState(() {
      isLoadPrompt = false;
    });
  }

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
          "Text Image",
          style: TextStyle(fontFamily: AppFont.metalManiaRegular),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: height/50,
              width: width/4,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               gradient: const LinearGradient(colors: [
                 Color(0xffBE45C8),
                 Color(0xff7068F9),
                 Color(0xffCA5ED6),
               ])
             ),
              child: const Center(
                child: AutoSizeText("Save",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
      body: isLoadPrompt == true ? const Center(child: CircularProgressIndicator(color: Color(0xffFFD233),)):Column(
      
        children: [
          SizedBox(height: height/30),
          Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: height/2,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(textToImageModel?.output?.first ?? ""),fit: BoxFit.cover)
                ),
            )
          ))
        ],
      ),
    );
  }
}
