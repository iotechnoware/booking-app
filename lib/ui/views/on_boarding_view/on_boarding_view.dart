import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/utils.dart';
import 'package:gofly/ui/views/sign_in_view/sign_in_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

// ignore: camel_case_types
class _OnBoardingViewState extends State<OnBoardingView> {
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
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor:notifire.backgroundallscreenColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 74),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(child: Image.asset('assets/images/onboardingscreen02.png'),),
              const SizedBox(height: 67),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Discover",
                    style: TextStyle(color: notifire.getdarkscolor,fontWeight: FontWeight.w400, fontSize: 40,fontFamily: 'Gilroy'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Amazing Places",
                    style: TextStyle(color: notifire.getdarkscolor,fontWeight: FontWeight.w600, fontSize: 40,fontFamily: 'Gilroy'),
                  ),
                ),
              ),
              const SizedBox(height: 11),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Adventure new places.",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 44),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 24,right: 24),
                child: FloatingActionButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    // ignore: sort_child_properties_last
                    child: const Text('GET STARTED',softWrap: true,
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16,fontFamily: 'Gilroy')),
                    backgroundColor: Colors.blueAccent.shade400,
                    onPressed: () {
                      storage.setFirstLunch(false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInView()),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
