import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gofly/apiwrapper.dart';
import 'package:gofly/old_file/bottomnavigationbar.dart';

import 'package:gofly/old_file/forgetpasswordscreen.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/colors.dart';
import 'package:gofly/ui/shared/utils.dart';
import 'package:gofly/ui/views/forget_password_view/forget_password_view.dart';
import 'package:gofly/ui/views/main_view/main_view.dart';
import 'package:gofly/ui/views/sign_in_view/sign_in_controller.dart';
import 'package:gofly/ui/views/sign_up_view/sign_up_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



// ignore: camel_case_types
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

// ignore: camel_case_types
class _SignInViewState extends State<SignInView> {

  bool value = false;
  bool _isVisible = false;

  //bool _isPasswordEightCharacters = false;
  //bool _hasPasswordOneNumber = false;

  // onPasswordChanged(String password1) {
  //   //final numericRegex = RegExp(r'[0-9]');
  //
  //   setState(() {
  //     //_isPasswordEightCharacters = false;
  //     //if (password1.length >= 8) _isPasswordEightCharacters = true;
  //
  //     //_hasPasswordOneNumber = false;
  //     //if (numericRegex.hasMatch(password1)) _hasPasswordOneNumber = true;
  //   });
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


  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    GoogleSignInAccount googleAccount = (await googleSignIn.signIn())!;
    GoogleSignInAuthentication auth = await googleAccount.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken
    );
    controller.signIn(
        email:googleAccount.email,
        token: auth.idToken,
        uniqueId:googleAccount.id,
        // password: googleAccount.
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  SignInController controller = SignInController();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: notifire.backgroundallscreenColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Welcome back",
                    style: TextStyle(
                        fontSize: 35, letterSpacing: 0, fontFamily: 'Gilroy',color: notifire.getdarkscolor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      TextField(
                        controller: controller.emailController,
                        style: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color:notifire.getgreycolor,
                            ),
                          ),
                          hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                          fillColor: Colors.white,
                          hintText: 'Enter Your Email',
                          labelText: "EMAIL",
                          labelStyle:TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      TextField(
                        style: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                        controller: controller.passwordController,
                        obscureText: _isVisible,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
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
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color:notifire.getgreycolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child:  Text(
                          "Forgetpassword?",
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                              color:notifire.getdarkscolor,
                              fontFamily: 'Gilroy'),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const ForgetPasswordView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: FloatingActionButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      // ignore: sort_child_properties_last
                      child: const Text('SIGN IN',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Gilroy')),
                      backgroundColor: Colors.blueAccent.shade400,
                      onPressed: () {
                        controller.signIn();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: Text(
                      "Or",
                      style: TextStyle(fontFamily: 'Gilroy',color: notifire.greytextColor),
                    ),),
                  const SizedBox(
                    height: 28,
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
                            heroTag: "btn1",
                            elevation: 0,
                            // ignore: sort_child_properties_last
                            child: SizedBox(
                              height: 33,
                              width: 33,
                              child: Image.asset('assets/old_images/g.png'),),
                            backgroundColor:notifire.notificationbackground1,
                            splashColor: null,
                            onPressed: () async {
                              signInWithGoogle();

                            },
                          ),
                        ),
                        SizedBox(
                          height: 66,
                          width: 66,
                          // ignore: duplicate_ignore
                          child: FloatingActionButton(
                            heroTag: "btn2",
                            elevation: 0,
                            // ignore: sort_child_properties_last
                            child: SizedBox(
                                height: 33,
                                width: 33,
                                child:
                                Image.asset('assets/old_images/Facebookloogin.png')),
                            backgroundColor: notifire.notificationbackground1,
                            onPressed: () async {
                              final GoogleSignIn googleSignIn = GoogleSignIn();
                              googleSignIn.disconnect();
                              await FirebaseAuth.instance.signOut();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 66,
                          width: 66,
                          child: FloatingActionButton(
                            heroTag: "btn3",
                            elevation: 0,
                            // ignore: sort_child_properties_last
                            child: SizedBox(
                                height: 33,
                                width: 33,
                                child: Image.asset('assets/old_images/ia.png',color:notifire.apple)),
                            backgroundColor: notifire.notificationbackground1,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: screenWidth(12),),

                  SizedBox(
                    height: screenWidth(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: screenWidth(50)),
                          child: const Text("don't have account"),
                        ),
                        InkWell(
                          onTap: (){ Get.to(const SignUpView()); },
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: screenWidth(50)),
                            child: Text('register',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.mainBlueColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),

          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Get.to(const MainView());
                    storage.setGuestLogin(true);
                  },
                  child: const Text(
                    'Continue as Guest',
                    style: TextStyle(fontSize: 16 , decoration: TextDecoration.underline),
                  ),
                ),
              ),
          ),

        ],
      ),
    );
// callLoginApi() {
//   final service = ApiServices();
//   service.Apiservice(
//     {
//       "email": email.text,
//       "password": password.text,
//     },
//   ).then(
//     (value) {
//       if (value.error != null) {
//         print("get data >>>>>> " + value.error!);
//       } else {
//         print(value.token!);
//         //push
//       }
//     },
//   );
// }
  }
}
