import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AiDataScreen extends StatefulWidget {
  const AiDataScreen({super.key});

  @override
  State<AiDataScreen> createState() => _AiDataScreenState();
}

class _AiDataScreenState extends State<AiDataScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.theamColor,
      appBar: AppBar(
        backgroundColor: AppColor.theamColor,
        leadingWidth: width/5,
        elevation: 0,
        title: SvgPicture.asset(AppImage.splashTxt),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: width/40),
          child: Image.asset(AppImage.proTag),
        ),
        actions: [
          SizedBox(width: width/40)
        ],
      ),
      body: Column(
        children: [
          // Text("Trending")
        ],
      ),
    );
  }
}
