import 'package:ai_generate/config/appcolor.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  String? hintText;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  bool? obscureText;
  String? Function(String?)? validator;
  int? maxLength;
  bool? enabled;
  CustomTextField({super.key,this.controller,this.suffixIcon,this.hintText,this.prefixIcon,this.keyboardType,this.obscureText,this.validator,this.maxLength,this.enabled});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height/15,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.whiteColor),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width/30),
          child: TextFormField(
            style: TextStyle(color: AppColor.whiteColor),
            enabled: enabled,
            maxLength: maxLength,
            validator: validator,
            obscureText: obscureText ?? false,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,

              hintStyle: TextStyle(fontSize: height/60,color: AppColor.whiteColor),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,

            ),
          ),
        ),
      ],
    );
  }
}
