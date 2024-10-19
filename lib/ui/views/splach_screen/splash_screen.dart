// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:get/get.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/utils.dart';
import 'package:gofly/ui/views/main_view/main_view.dart';
import 'package:gofly/ui/views/on_boarding_view/on_boarding_view.dart';
import 'package:gofly/ui/views/sign_in_view/sign_in_view.dart';
import 'package:gofly/ui/views/splach_screen/splash_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }
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
  @override
  void dispose() {
    // TODO: implement dispose
    Timer(
      const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const OnBoardingView(),
        ),
      ),
    ).cancel();
    // Timer(
    //   Duration(seconds: 3),
    //       () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => onboarding(),
    //     ),
    //   ),
    // );
    super.dispose();
  }

  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => storage.getFirstLunch() ? const OnBoardingView()  :
          storage.getLogIn() || storage.getGuestLogin() ? const MainView() : const SignInView(),
        ),
      ),
    );
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.splashscreenprimeryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 122,
              width: 122,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Center(
            child: Text(
              "DNA Holidays",
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  letterSpacing: 3,
                  color: Color(0xffFFFFFF)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
