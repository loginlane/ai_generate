import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/model/seeall_model.dart';
import 'package:ai_generate/services/apiservice.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../config/appfont.dart';

class SeeAll extends StatefulWidget {
  String title;
  String catogeryId;
    SeeAll({super.key,required this.title,required this.catogeryId});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {

  SeeAllModel? seeAllModel;
  bool isLoadSeeAllData = false;
  int count = 7;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seeAllData();
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
        title: AutoSizeText(widget.title ?? "",style: TextStyle(fontFamily: AppFont.metalManiaRegular,fontSize: 25,color: AppColor.textColor),),
        centerTitle: true,
      ),
      body: isLoadSeeAllData == true ? const Center(child: CircularProgressIndicator()): Padding(
        padding: EdgeInsets.symmetric(horizontal: width/40),
        child: SingleChildScrollView(
          child: Column(
            children: [
            Container(
              height: height/3,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(seeAllModel?.data?.first.imageName ?? ""),fit: BoxFit.cover)
              ),
            ),
              SizedBox(height: height/50),
              SizedBox(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: seeAllModel!.data!.length - 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  mainAxisExtent: 250.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 8.0
                  ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: NetworkImage(seeAllModel?.data?[index+1].imageName ?? ""),fit: BoxFit.fill)
                        ),
                      );
                    },),
              ),

            ],
          ),
        ),
      )
    );
  }

  seeAllData() async {
    setState(() {
      isLoadSeeAllData = true;
    });
    seeAllModel = await ApiServicesClass.aeeAllImageList(id: widget.catogeryId);

    setState(() {
      isLoadSeeAllData = false;
    });
    }
}
