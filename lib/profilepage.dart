// ignore_for_file: prefer_const_constructors

import 'package:gofly/editprofile.dart';
import 'package:gofly/homepage1.dart';
import 'package:gofly/switchoftheme.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class profilemain extends StatefulWidget {
  const profilemain({Key? key}) : super(key: key);

  @override
  State<profilemain> createState() => _profilemainState();
}

// ignore: camel_case_types
class _profilemainState extends State<profilemain> {
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

  //final _controller13 = ValueNotifier<bool>(false);
  // bool _enabled = false;
  // bool _themeDark = false;

  @override
  void initState() {
    super.initState();
    // print("$_controller13");
    // _controller13.addListener(() {
    //   setState(() async {
    //     final prefs = await SharedPreferences.getInstance();
    //     bool? _controller13 = prefs.getBool("setIsDark");
    //     if (_controller13 == null) {
    //       notifire.setIsDark = false;
    //     } else {
    //       notifire.setIsDark = _controller13;
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.backgroundallscreenColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: notifire.backgroundallscreenColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (BuildContext context) => const home1(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4, top: 8),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: notifire.backbuttonborderColor),
                    borderRadius: BorderRadius.circular(16)),
                // ignore: sort_child_properties_last
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: notifire.backbuttoniconColor,
                    ),
                    iconSize: 14,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const home1(),
                        ),
                      );
                    },
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //SizedBox(width: 50),
              Transform.scale(
                scale: 0.6,
                child: LiteRollingSwitch(
                  iconOn: Icons.nightlight,
                  iconOff:Icons.sunny,
                  animationDuration: const Duration(milliseconds:500),
                  textOn: 'Dark',
                  textOff: 'Light',
                  colorOn: const Color(0xff2E2F3E),
                  colorOff:const Color(0xff1F75EC),
                  value: status,
                  onChanged: (bool value) async {
                    setState(() {
                      status = value;
                    });
                    final prefs = await SharedPreferences.getInstance();
                    setState(
                          (){
                        notifire.setIsDark = value;
                        prefs.setBool("setIsDark", value);
                      },
                    );
                  },
                  onDoubleTap: () {},
                  onSwipe: () {},
                  onTap: () {},
                ),
              ),
              // Tooltip(
              //   message: 'Themes',
              //   waitDuration: Duration(seconds: 1),
              //   showDuration: Duration(seconds: 1),
              //   padding: EdgeInsets.all(5),
              //   height: 35,
              //   textStyle: TextStyle(
              //       fontSize: 15,
              //       color: Colors.white,
              //        fontFamily: "gilroy",
              //        backgroundColor:Colors.transparent,
              //       fontWeight: FontWeight.normal),
              //   child: AdvancedSwitch(
              //     thumb: ValueListenableBuilder(
              //       valueListenable: _controller13,
              //       builder: (_,_controller13, __) {
              //         return Icon(_controller13 != true
              //             ? Icons.sunny
              //             : Icons.nightlight);
              //       },
              //     ),
              //     controller: _controller13,
              //     activeImage: AssetImage('assets/night_background.png'),
              //     inactiveImage: AssetImage('assets/day_background.png'),
              //   ),
              // ),

              // Transform.scale(
              //   scale: 0.8,
              //   child: CupertinoSwitch(
              //     value: status,
              //     activeColor: notifire.getbluecolor,
              //     onChanged: (bool value) async {
              //       setState(() {
              //         status = value;
              //       });
              //       final prefs = await SharedPreferences.getInstance();
              //       setState(
              //         () {
              //           notifire.setIsDark = value;
              //           prefs.setBool("setIsDark", value);
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ],
        title: Text(
          "Profile",
          style: TextStyle(
              color: notifire.getdarkscolor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: 'Gilroy'),
        ),
      ),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(200), // here the desired height
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 70),
      //             child: Container(
      //                 child: Image.asset(
      //               "assets/profiledesign1.png",
      //               scale: 12,
      //             )),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   // Navigator.of(context).pop(
      //                   //   MaterialPageRoute(
      //                   //     builder: (BuildContext context) =>
      //                   //     const filtershortdetail(),
      //                   //   ),
      //                   // );
      //                 },
      //                 child: Container(
      //                   height: 48,
      //                   width: 48,
      //                   margin: EdgeInsets.only(left: 24),
      //                   child: Image.asset("assets/arrowprofile.png"),
      //                   decoration: BoxDecoration(
      //                     // image: DecorationImage(
      //                     //   image: AssetImage("assets/arrowprofile.png"),
      //                     // ),
      //                     borderRadius: BorderRadius.circular(16),
      //                   ),
      //                   // alignment: Alignment.center,
      //                   // child: IconButton(
      //                   //   icon: const Icon(
      //                   //     Icons.arrow_back_ios_new_outlined,
      //                   //   ),
      //                   //   iconSize: 20,
      //                   //   color: Colors.black,
      //                   //   onPressed: () {
      //                   //     Navigator.of(context).pop(
      //                   //       MaterialPageRoute(
      //                   //         builder: (BuildContext context) =>
      //                   //         const filtershortdetail(),
      //                   //       ),
      //                   //     );
      //                   //   },
      //                   // ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(),
      //                 child: const Text(
      //                   "Profile",
      //                   //textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.w400,
      //                     fontSize: 18,
      //                     color: Color(0xff0F182E),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: notifire.backgroundallscreenColor,
                    // image: DecorationImage(
                    //   image: AssetImage("assets/profileblue.png",),
                    //   scale: 0.1
                    //    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(70),
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 750,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(70),
                          topLeft: Radius.circular(70),
                        ),
                        color: notifire.profileColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 65),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const editprofile(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "EDIT PROFILE",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: notifire.greytextColor,
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Gilroy'),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 36, top: 38),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "NAME",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: notifire.greytextColor,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  const Row(
                                    children: [
                                      Text(
                                        "Percy Jackshon",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Text(
                                        "GENDER",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: notifire.greytextColor,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: const [
                                      Text(
                                        "MALE",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Text(
                                        "DATE OF BIRTH",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: notifire.greytextColor,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: const [
                                      Text(
                                        "12/12/2022",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Text(
                                        "NATIONALITY",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: notifire.greytextColor,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: const [
                                      Text(
                                        "ENGLAND",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Text(
                                        "EMAIL",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: notifire.greytextColor,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: const [
                                      Text(
                                        "percyjacks@gmail.com",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontFamily: 'Gilroy'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 113,
                width: 113,
                margin: const EdgeInsets.only(top: 40),
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 2),
                  image: const DecorationImage(
                      image: AssetImage(
                        "assets/editprofile.png",
                      ),
                      scale: 0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _controller00 {}

// class CurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = new Path();
//     // path starts with (0.0, 0.0) point (1)
//     path.lineTo(1, size.height - 150);
//     path.quadraticBezierTo(
//         size.width / 2, size.height, size.width, size.height - 150);
//     path.lineTo(size.width, 0.0);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
