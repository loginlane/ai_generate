import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appfont.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/model/bannerlist_model.dart';
import 'package:ai_generate/services/apiservice.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AiCatogery extends StatefulWidget {
  const AiCatogery({super.key});

  @override
  State<AiCatogery> createState() => _AiCatogeryState();
}

class _AiCatogeryState extends State<AiCatogery> {

  BannerListModel? bannerListModel;
  bool isLoadBannerList = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannerListData();
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
        actions: [SizedBox(width: width / 40)],
      ),
      body: isLoadBannerList == true ? const Center(child: CircularProgressIndicator(color: Color(0xffFFD233))): Padding(
        padding: EdgeInsets.symmetric(horizontal: width/40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height/40),
            AutoSizeText("select your cetegory",style: TextStyle(color: AppColor.whiteColor,fontSize: height/50),),
            SizedBox(height: height/40),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: bannerListModel?.data?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: height/5.5,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: NetworkImage(bannerListModel?.data?[index].bannerImage ?? ""),fit: BoxFit.cover)
                        ),
                       child:  Padding(
                         padding:  EdgeInsets.only(right: width/25,top: height/8,left: width/1.5,bottom: height/50),
                         child: Container(
                           height: height/20,
                           width: width/1.4,
                          decoration: BoxDecoration(
                            color: AppColor.theamColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                           child: Center(child: Padding(
                             padding: const EdgeInsets.all(5),
                             child: AutoSizeText(bannerListModel?.data?[index].bannerName ?? "",textAlign: TextAlign.end,style: TextStyle(fontSize: 18,color: AppColor.whiteColor,fontWeight: FontWeight.w400),),
                           )),
                         )
                       ),
                      ),
                      SizedBox(height: index == bannerListModel!.data!.length -1  ?height/6 :height/55)
                    ],
                  );
              },),
            )

          ],
        ),
      ),
    );
  }

   bannerListData() async {
     setState(() {
       isLoadBannerList = true;
     });
       bannerListModel = await ApiServicesClass.bannerList();
     setState(() {
       isLoadBannerList = false;
     });
   }
}
