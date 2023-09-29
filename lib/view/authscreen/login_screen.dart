import 'package:ai_generate/config/appcolor.dart';
import 'package:ai_generate/config/appimage.dart';
import 'package:ai_generate/config/custombutton.dart';
import 'package:ai_generate/config/customtextfild.dart';
import 'package:ai_generate/config/validationfile.dart';
import 'package:ai_generate/model/login_model.dart';
import 'package:ai_generate/services/apiservice.dart';
import 'package:ai_generate/view/authscreen/register_screen.dart';
import 'package:ai_generate/view/bottom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool passwordEye = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.theamColor,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: height/15),
            SvgPicture.asset(AppImage.loginAvtar,height: height/3.8),
            const Spacer(),
            Container(
              height: height/1.5,
              width: width,
             decoration: const BoxDecoration(
               color: Color(0xff2A3240),
               borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
             ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width/20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: height/40),
                      Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.whiteColor,fontSize: height/30),),
                      SizedBox(height: height/40),
                      CustomTextField(
                        validator: (value) {
                          return FieldValidation.normalValidation(
                              value: value,
                              errorText: "Please enter email"
                          );
                        },
                        controller: emailController,
                        hintText: "Email",
                      ),
                      SizedBox(height: height/40),
                  CustomTextField(
                    controller: passwordController,
                    validator: (value) {
                      return FieldValidation.normalValidation(
                          value: value,
                          errorText: "Please enter password"
                      );
                    },
                    obscureText: passwordEye,
                    hintText: "EnterPassword",
                    suffixIcon: GestureDetector(
                        onTap: () {
                       setState(() {
                         passwordEye = !passwordEye;
                       });
                        },
                        child: passwordEye
                            ?   Icon(Icons.remove_red_eye,color: AppColor.whiteColor,)
                            :   Icon(Icons.visibility_off_sharp,color: AppColor.whiteColor,
                        )),
                  ),
                      SizedBox(height: height/30),
                      customButton(title: "Login",
                     onTap: () async {
                       if (formKey.currentState!.validate()){
                         Loader.show(context);
                       LoginModel loginModel =  await ApiServicesClass.login(email: emailController.text,password: passwordController.text);
                         Loader.hide();
                       if(loginModel.success == true){
                         Fluttertoast.showToast(msg: loginModel.message ?? "");
                         SharedPreferences pref = await SharedPreferences.getInstance();
                         pref.setString('Token', loginModel.data?.token ?? "");
                         Navigator.push(context, MaterialPageRoute(builder: (context) => BottomScreen()));
                       }
                       }
                     },
                      ),
                      SizedBox(height: height/30),
                      Text("Forget password?",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.normal,fontSize: height/50),),
                      SizedBox(height: height/30),
                      Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                              child: Divider(
                                thickness: 1,
                                color: AppColor.whiteColor,
                              )),
                        ),

                        Text("OR",style: TextStyle(color: AppColor.whiteColor,fontSize: height/50),),

                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                              child: Divider(
                                thickness: 1,
                                color: AppColor.whiteColor,
                              )),
                        ),
                      ]),
                      SizedBox(height: height/30),
                      Container(
                        height: height/16,
                        width: width,
                        decoration: BoxDecoration(
                           border: Border.all(color: AppColor.whiteColor),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: width/22),
                            SvgPicture.asset(AppImage.gLoginLogo),
                            SizedBox(width: width/22),
                            Container(
                              height: height/35,
                              width: width/250,
                              color: AppColor.whiteColor,
                            ),
                            SizedBox(width: width/6),
                            Text("Login with Google",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.normal,fontSize: height/50),)
                          ],
                        ),
                      ),
                      SizedBox(height: height/40),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("First time here?",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.normal,fontSize: height/50),),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                              },
                              child: Text("Sign up for free",style: TextStyle(color: const Color(0xffFFD233),fontWeight: FontWeight.bold,fontSize: height/50),)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
