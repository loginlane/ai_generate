import 'dart:io';

import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/config/custombutton.dart';
import 'package:ai_generate/config/customtextfild.dart';
import 'package:ai_generate/config/validationfile.dart';
import 'package:ai_generate/model/register_model.dart';
import 'package:ai_generate/services/apiservice.dart';
import 'package:ai_generate/view/bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordEye = false;
  bool confirmPasswordEye = false;
  bool teams = false;

  XFile? image;
  ImagePicker picker = ImagePicker();

  TextEditingController fNAmeController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.theamColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: height / 15),
                // Center(
                //     child: SvgPicture.asset(AppImage.signUplogo,
                //         height: height / 3.8)),
                SizedBox(height: height / 40),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.whiteColor,
                      fontSize: height / 30),
                ),
                SizedBox(height: height / 80),
                Text(
                  "Hello there! Let’s create your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.whiteColor, fontSize: height / 55),
                ),
                SizedBox(height: height / 40),


              Center(
                child: Stack(
                  children: [
                    image == null ? Container(
                      padding: const EdgeInsets.all(10.0),
                      width:  width / 2.5,
                      height: width / 2.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white, width: 5),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                          AppImage.userDefaultPic,color: AppColor.whiteColor),
                    ) : Container(
                      padding: const EdgeInsets.all(10.0),
                      width: width / 2.5,
                      height: width / 2.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white, width: 5),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                                File(image!.path))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width / 3.6, top: height / 7.5),
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            showPicker(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),


                SizedBox(height: height / 40),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: fNAmeController,
                        validator: (value) {
                          return FieldValidation.normalValidation(
                              value: value,
                              errorText: "Please enter first name");
                        },
                        hintText: "First name",
                      ),
                    ),
                    SizedBox(width: width / 20),
                    Expanded(
                      child: CustomTextField(
                        controller: lNameController,
                        validator: (value) {
                          return FieldValidation.normalValidation(
                              value: value,
                              errorText: "Please enter last name");
                        },
                        hintText: "Last name",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 40),
                CustomTextField(
                  validator: (value) {
                    return FieldValidation.normalValidation(
                        value: value, errorText: "Please enter email");
                  },
                  controller: emailController,
                  hintText: "Email",
                ),
                SizedBox(height: height / 40),
                CustomTextField(
                  validator: (value) {
                    return FieldValidation.normalValidation(
                        value: value, errorText: "Please enter password");
                  },
                  controller: passwordController,
                  obscureText: passwordEye,
                  hintText: "Password",
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordEye = !passwordEye;
                        });
                      },
                      child: passwordEye
                          ? Icon(
                              Icons.remove_red_eye,
                              color: AppColor.whiteColor,
                            )
                          : Icon(
                              Icons.visibility_off_sharp,
                              color: AppColor.whiteColor,
                            )),
                ),
                SizedBox(height: height / 40),
                CustomTextField(
                  validator: (value) {
                    return FieldValidation.createConfirmPasswordValidation(
                        value: value,
                        errorText: "Please enter confirm password",
                        password: passwordController);
                  },
                  controller: confirmPasswordController,
                  obscureText: confirmPasswordEye,
                  hintText: "Confirm password",
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          confirmPasswordEye = !confirmPasswordEye;
                        });
                      },
                      child: confirmPasswordEye
                          ? Icon(
                              Icons.remove_red_eye,
                              color: AppColor.whiteColor,
                            )
                          : Icon(
                              Icons.visibility_off_sharp,
                              color: AppColor.whiteColor,
                            )),
                ),
                SizedBox(height: height / 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: height / 70,
                          width: width / 20,
                          child: Checkbox(side: BorderSide(color: AppColor.whiteColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            value: teams,
                            onChanged: (value) {
                              setState(() {
                                teams = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: width / 50),
                        Text(
                          'I agree to platform',
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: height / 55),
                        ),
                        SizedBox(width: width / 80),
                        Text(
                          'Terms of Service',
                          style: TextStyle(
                              color: const Color(0xffFFD233),
                              fontWeight: FontWeight.bold,
                              fontSize: height / 55),
                        ),
                        SizedBox(width: width / 80),
                        Text(
                          'and',
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: height / 55),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 13),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            color: const Color(0xffFFD233),
                            fontWeight: FontWeight.bold,
                            fontSize: height / 55),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 30),
                customButton(
                  title: "Create account",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if(teams == true){

                          Loader.show(context);
                          RegisterModel registerModel =
                          await ApiServicesClass.register(
                              fName: fNAmeController.text,
                              lName: lNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              profileImage: image==null ? "" : File(image!.path)
                          );
                          Loader.hide();
                          if(registerModel.success == true){
                            Fluttertoast.showToast(msg: registerModel.message ?? "");
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            await pref.setString('Token', registerModel.data?.token ?? "");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomScreen()));
                          }

                      }else if(teams == false){
                        Fluttertoast.showToast(msg: "Please check terms and condition");
                      }
                    }
                  },
                ),
                SizedBox(height: height / 30),
                Divider(thickness: 1, color: AppColor.whiteColor),
                SizedBox(height: height / 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Joined us before?',
                      style: TextStyle(
                          color: AppColor.whiteColor, fontSize: height / 55),
                    ),
                    SizedBox(width: width / 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: const Color(0xff74B4FF),
                            fontWeight: FontWeight.bold,
                            fontSize: height / 55),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
  showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, _setState) {
            return SafeArea(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.photo_library),
                        title: Text('Gallery'),
                        onTap: () async {
                          image = await picker.pickImage(source: ImageSource.gallery);
                          setState(() {});
                          Navigator.pop(context);
                        }),
                    ListTile(
                      leading: Icon(Icons.photo_camera),
                      title: Text('Camera'),
                      onTap: () async {
                        image = await picker.pickImage(source: ImageSource.camera);
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}
