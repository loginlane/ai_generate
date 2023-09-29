import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appfont.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/model/trandingimage_model.dart';
import 'package:ai_generate/view/ai_data/seeall.dart';
import 'package:ai_generate/view/tryprompt.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../services/apiservice.dart';

class AiDataScreen extends StatefulWidget {
  const AiDataScreen({super.key});

  @override
  State<AiDataScreen> createState() => _AiDataScreenState();
}

class _AiDataScreenState extends State<AiDataScreen> {

  TrandingImageModel? trandingImageModel;
  bool isLoadTrandingImage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trandingImage();
  }
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
        title: AutoSizeText("Ai Avatar",style: TextStyle(fontFamily: AppFont.metalManiaRegular,fontSize: 30,color: AppColor.textColor),),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: width / 40),
          child: Image.asset(AppImage.proTag),
        ),
        actions: [
          const CircleAvatar(backgroundColor: Color(0xffFFD233),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: CircleAvatar(

              ),
            ),
          ),
          SizedBox(width: width/40)
        ],
      ),
      body: isLoadTrandingImage == true ? const Center(child: CircularProgressIndicator(color: Color(0xffFFD233))):Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height/50),
           Expanded(

             child: ListView.builder(
               shrinkWrap: true,
               itemCount: trandingImageModel?.data?.length,
               // scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {
               return Column(
                 children: [
                   Padding(
                     padding: EdgeInsets.only(right: width/40),
                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: height/50),
                          Row(
                            children: [
                              AutoSizeText(
                               trandingImageModel?.data?[index].categoryName ?? "",
                               style: TextStyle(fontSize: 20,color: AppColor.whiteColor,fontWeight: FontWeight.bold),
                               maxLines: 2,
                             ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAll(title:  trandingImageModel?.data?[index].categoryName ?? "",catogeryId:   trandingImageModel?.data?[index].categoryId ?? ""),));
                                },
                                child: AutoSizeText(
                                  "See all",
                                  style: TextStyle(fontSize: 9,color: AppColor.whiteColor),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                         SizedBox(height: height/70),
                        SizedBox(
                          height: height/3.7,
                          child: ListView.builder(
                            itemCount: trandingImageModel?.data?[index].categoryImage?.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, indexImage) {
                            return Padding(
                              padding:  EdgeInsets.only(left: indexImage ==0 ? 0 :width/40),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TryPrompt(image: trandingImageModel?.data?[index].categoryImage?[indexImage].imageName ?? ""),));
                                },
                                child: Container(
                                  height: height/4,
                                  width: width/3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(trandingImageModel?.data?[index].categoryImage?[indexImage].imageName ?? ""),fit: BoxFit.cover),
                                      border: Border.all(color: AppColor.homeFrameColor,width: 2),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                ),
                              ),
                            );
                          },),
                        ),

                       ],
                     ),
                   ),
                   SizedBox(height: index == trandingImageModel!.data!.length -1  ?height/6 :height/55)
                 ],
               );

             },),
           ),
          ],
        ),
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
