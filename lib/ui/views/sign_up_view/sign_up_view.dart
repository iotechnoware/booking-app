// ignore_for_file: sort_child_properties_last

import 'package:get/get.dart';
import 'package:gofly/apiwrapper.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:gofly/ui/views/sign_up_view/sign_up_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gofly/apicontroller.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

// ignore: camel_case_types
class _SignUpViewState extends State<SignUpView> {
  bool _isVisible = false;


  final _formKey = GlobalKey<FormState>();
  late ColorNotifire notifire;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }


  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgroundallscreenColor,
      //resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20 , top: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Enter your information below to get\nstarted your trips",
                  style: TextStyle(
                      fontSize: 18,
                      color:notifire.greytextColor,
                      fontFamily: 'Gilroy'),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [

                    TextFormField(
                      controller: controller.firstnameController,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        fillColor: Colors.white,
                        hintText: 'Enter Your first name',
                        labelText: "FULL NAME",
                        labelStyle:TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:notifire.getgreycolor,
                          ),
                        ),
                        // decoration: InputDecoration(
                        //   hintText: 'percy jackson',
                        //   labelText: "FULL NAME",
                        //   border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //     borderSide: const BorderSide(
                        //       color: Colors.red,
                        //       width: 5.0,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.lastnameController,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter last Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        fillColor: Colors.white,
                        hintText: 'Enter Your full name',
                        labelText: "FULL NAME",
                        labelStyle:TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:notifire.getgreycolor,
                          ),
                        ),
                        // decoration: InputDecoration(
                        //   hintText: 'percy jackson',
                        //   labelText: "FULL NAME",
                        //   border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //     borderSide: const BorderSide(
                        //       color: Colors.red,
                        //       width: 5.0,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      style: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        fillColor: Colors.white,
                        hintText: 'Enter Your Email',
                        labelText: "EMAIL",
                        labelStyle:TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:notifire.getgreycolor,
                          ),
                        ),
                        // decoration: InputDecoration(
                        //   hintText: 'percy jackson',
                        //   labelText: "FULL NAME",
                        //   border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(10),
                        //     borderSide: const BorderSide(
                        //       color: Colors.red,
                        //       width: 5.0,
                        //     ),
                        //   ),
                        // ),
                      ),
                      // decoration: InputDecoration(
                      //   hintText: 'i.e,percyjackson@gmail.com',
                      //   labelText: "EMAIL",
                      //   border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: const BorderSide(
                      //       color: Colors.red,
                      //       width: 5.0,
                      //     ),
                      //   ),
                      // ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: _isVisible,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          )
                              : const Icon(
                            Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        labelText:"PASSWORD" ,
                        labelStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:notifire.getgreycolor,
                          ),
                        ),
                        // hintText: 'Enter Your Password',
                        // labelText: "PASSWORD",
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10),
                        //   borderSide: const BorderSide(
                        //     color: Colors.red,
                        //     width: 5.0,
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: FloatingActionButton(
                    elevation: 0,
                    heroTag: 'Sign-up',
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text('SIGN UP',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontFamily: 'Gilroy')),
                    backgroundColor: Colors.blueAccent.shade400,
                    autofocus: true,
                    onPressed: () {
                      controller.signup();
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    "Or",
                    style: TextStyle(fontFamily: 'Gilroy',color: notifire.greytextColor),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 66,
                        width: 66,
                        decoration: const BoxDecoration(),
                        child: FloatingActionButton(
                          elevation: 0,
                          heroTag: 'Google login',
                          // ignore: sized_box_for_whitespace
                          child: Container(
                              height: 33,
                              width: 33,
                              child: Image.asset('assets/old_images/g.png')),
                          backgroundColor: notifire.notificationbackground1,
                          splashColor: null,
                          onPressed: () {},
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 66,
                        width: 66,
                        // ignore: duplicate_ignore
                        child: FloatingActionButton(
                          elevation: 0,
                          heroTag: 'facebook login',
                          // ignore: sized_box_for_whitespace
                          child: Container(
                              height: 33,
                              width: 33,
                              child: Image.asset('assets/old_images/Facebookloogin.png')),
                          backgroundColor: notifire.notificationbackground1,
                          onPressed: () {},
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 66,
                        width: 66,
                        child: FloatingActionButton(
                          elevation: 0,
                          heroTag: 'apple login',
                          // ignore: sized_box_for_whitespace
                          child: Container(
                              height: 33,
                              width: 33,
                              child: Image.asset('assets/old_images/ia.png',color: notifire.apple,)),
                          backgroundColor: notifire.notificationbackground1,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
