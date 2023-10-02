import 'dart:io';

import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appfont.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/config/custombutton.dart';
import 'package:ai_generate/model/texttoimage_model.dart';
import 'package:ai_generate/model/trandingimage_model.dart';
import 'package:ai_generate/services/apiservice.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';




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
  bool isLoadTrandingImage = false;

  TrandingImageModel? trandingImageModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageGenrate();
    trandingImage();
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
          GestureDetector(
            onTap: () => _saveImage(context,textToImageModel),
            child: Padding(
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
          )),
          SizedBox(height: height/13),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/20),
            child: Row(
              children: [
                AutoSizeText("Change AI",style: TextStyle(color: AppColor.whiteColor,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: height/50),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: trandingImageModel?.data?.length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () async {
                    await imageGenrate();
                  },
                  child: Container(
                      height: height/5,
                      width: width/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: NetworkImage(trandingImageModel?.data?[index].categoryImage?[index].imageName ?? ""),fit: BoxFit.cover)
                      ),
                       ),
                ),
              );
            },),
          ),
          SizedBox(height: height/50),
        ],
      ),
    );
  }
  trandingImage() async {
    setState(() {
      isLoadTrandingImage = true;
    });
    trandingImageModel = await ApiServicesClass.trandingImageList();
    setState(() {
      isLoadTrandingImage = false;
    });
  }
}

Future<void> _saveImage(BuildContext context,textToImageModel) async {
  String? message;
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  try {
    // Download image
    final http.Response response = await http.get(Uri.parse(textToImageModel?.output?.first ?? ""));

    // Get temporary directory
    final dir = await getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/image.png';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes);

    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      message = 'Image saved to disk';
    }
  } catch (e) {
    message = 'An error occurred while saving the image';
  }

  if (message != null) {
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
  }
}