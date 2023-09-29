import 'dart:convert';

import 'package:ai_generate/config/api_point.dart';
import 'package:ai_generate/model/bannerlist_model.dart';
import 'package:ai_generate/model/login_model.dart';
import 'package:ai_generate/model/register_model.dart';
import 'package:ai_generate/model/seeall_model.dart';
import 'package:ai_generate/model/trandingimage_model.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/texttoimage_model.dart';

class ApiServicesClass {

  static Future trandingImageList() async {
    try{
      var response = await http.get(Uri.parse(ApiPoints.baseUrl + ApiPoints.trandingImage));
      if(response.statusCode == 200 || response.statusCode == 201){
        return trandingImageModelFromJson(response.body);
      }
    }catch(e){
      print(e);
    }
  }

  static Future aeeAllImageList({id}) async {
    try{
      var response = await http.get(Uri.parse(ApiPoints.baseUrl + ApiPoints.imageByCategory + id));
      if(response.statusCode == 200 || response.statusCode == 201){
        return seeAllModelFromJson(response.body);
      }
    }catch(e){
      print(e);
    }
  }

  static Future bannerList() async {
    try{
      var response = await http.get(Uri.parse(ApiPoints.baseUrl + ApiPoints.bannerList));
      if(response.statusCode == 200 || response.statusCode == 201){
        return bannerListModelFromJson(response.body);
      }
    }catch(e){
      print(e);
    }
  }

/// Login
  static Future login({email,password}) async {
    try{
      var response = await http.post(Uri.parse(ApiPoints.baseUrl + ApiPoints.login),

      body: {
        'email': email,
        'password' : password
      },
        headers: {'accept': 'application/json'},

      );
      if(response.statusCode == 200 || response.statusCode == 201){
        return loginModelFromJson(response.body);
      }else {
        Loader.hide();
        Fluttertoast.showToast(msg: "${jsonDecode(response.body)['message']}");
      }
    }catch(e){
      print(e);
    }
  }


  /// Register
  static Future register({fName,lName,email,password,confirmPassword,profileImage}) async {
    try{

          var request = http.MultipartRequest(
          'POST', Uri.parse(ApiPoints.baseUrl + ApiPoints.register));
          request.fields['first_name'] = fName ?? "";
          request.fields['last_name'] = lName ?? "";
          request.fields['email'] = email ?? "";
          request.fields['password'] = password ?? "";
          request.fields['password_confirmation'] = confirmPassword ?? "";
          profileImage== null || profileImage=="" ? request.fields['profile_image'] = "":request.files.add(await http.MultipartFile.fromPath(
            "profile_image",
            profileImage.path,
          ));

      var res = await request.send();
      var response = await http.Response.fromStream(res);

      if(response.statusCode == 200 || response.statusCode == 201){
        return registerModelFromJson(response.body);
      }else {
        Loader.hide();
        Fluttertoast.showToast(msg: "${jsonDecode(response.body)['message']}");
      }
    }catch(e){
      print(e);
    }
  }

  /// Text To Image
  static Future textToImage({txt}) async {
    var response = await http.post(Uri.parse("https://stablediffusionapi.com/api/v3/text2img"),
        headers: {
          'accept': 'application/json',
        },
        body: {
          "key" : "uSRxwKSm9OpzZUCxw1U7gAVb0MlZEoiSbKpJhhrlkbO2MAwFXfcunkeIk6sX",
          "prompt" : txt,
          "negative_prompt" : "",
          "width" : "512",
          "height" : "512",
          "samples" : "1",
          "num_inference_steps" : "20",
          "safety_checker" : "yes",
          "enhance_prompt" : "yes",
          "seed" : "",
          "guidance_scale" : "7.5",
          "multi_lingual" : "no",
          "panorama" : "no",
          "self_attention" : "no",
          "upscale" : "no",
          "embeddings_model" : "",
          "webhook" : "",
          "track_id" : ""
        }
    );
    print(response);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200 || response.statusCode == 201){
      return textToImageModelFromJson(response.body);
    }
  }

}