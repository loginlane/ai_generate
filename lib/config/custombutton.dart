import 'package:ai_generate/config/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customButton({title,void Function()? onTap}){
 return GestureDetector(
   onTap: onTap,
   child: Container(
      height: Get.height/16,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xffBE45C8),
            Color(0xff7068F9),
            Color(0xffCA5ED6),
          ]),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(title,style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold,fontSize: Get.height/50),),
      ),
    ),
 );
}