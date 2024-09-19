// ignore_for_file: duplicate_import

import 'dart:ui';
import 'package:gofly/explorepagebestdeals.dart';
import 'package:gofly/explorepageseeallbestdeals.dart';
import 'package:gofly/explorepageseeallbestdestination.dart';
import 'package:gofly/notificationmain.dart';
import 'package:gofly/profilepage.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'explorepagebestdeals.dart';
import 'explorepageseealldealsbymonth.dart';

// ignore: camel_case_types
class explorepageofnavigationbar extends StatefulWidget {
  const explorepageofnavigationbar({Key? key}) : super(key: key);

  @override
  State<explorepageofnavigationbar> createState() =>
      _explorepageofnavigationbarState();
}

// ignore: camel_case_types
class _explorepageofnavigationbarState
    extends State<explorepageofnavigationbar> {
  final search = TextEditingController();
  List<List1> bestdestinations = [
    List1(
        image:
            "https://images.unsplash.com/photo-1569165003085-e8a1066f1cb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2371&q=80",
        name: "Family Trip"),
    List1(
        image:
            "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg",
        name: "Longer Trip"),
    List1(
        image:
            "https://images.unsplash.com/photo-1580837119756-563d608dd119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name: "Shorter Trip"),
    List1(
        image:
            "https://images.unsplash.com/photo-1523978591478-c753949ff840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name: "Norway"),
    List1(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU",
        name: "England"),
    List1(
        image:
            "https://images.unsplash.com/photo-1548678967-f1aec58f6fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JlZWNlJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
        name: "Greece"),
  ];
  List<List2> bestdeals = [
    List2(
        image1:
            "https://images.unsplash.com/photo-1569165003085-e8a1066f1cb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2371&q=80",
        name1: "Family Trip"),
    List2(
        image1:
            "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg",
        name1: "Longer Trip"),
    List2(
        image1:
            "https://images.unsplash.com/photo-1580837119756-563d608dd119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name1: "Shorter Trip"),
    List2(
        image1:
            "https://images.unsplash.com/photo-1523978591478-c753949ff840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name1: "Norway"),
    List2(
        image1:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU",
        name1: "England"),
    List2(
        image1:
            "https://images.unsplash.com/photo-1548678967-f1aec58f6fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JlZWNlJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
        name1: "Greece"),
  ];

  List<List3> dealsbymonth = [
    List3(
        image2:
            "https://images.unsplash.com/photo-1569165003085-e8a1066f1cb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2371&q=80",
        name2: "January"),
    List3(
        image2:
            "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg",
        name2: "Fabruary"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1580837119756-563d608dd119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name2: "March"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1523978591478-c753949ff840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name2: "April"),
    List3(
        image2:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU",
        name2: "May"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1548678967-f1aec58f6fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JlZWNlJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
        name2: "June"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1503152394-c571994fd383?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540&q=80",
        name2: "July"),
    List3(
        image2:
            "https://media.istockphoto.com/photos/london-in-autumn-time-concept-with-a-person-holding-a-british-in-picture-id1348042661?s=612x612",
        name2: "August"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3383&q=80",
        name2: "September"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1533105079780-92b9be482077?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80",
        name2: "October"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80",
        name2: "November"),
    List3(
        image2:
            "https://images.unsplash.com/photo-1552733407-5d5c46c3bb3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHRyYXZlbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
        name2: "December"),
  ];
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
      appBar: AppBar(
        backgroundColor: notifire.backgroundallscreenColor,

        automaticallyImplyLeading: false,
        toolbarHeight: 85,
        //toolbarOpacity: 0,
        elevation: 0,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const profilemain(),
                    ),
                  );
                  setState(
                        () {
                      // ZoomDrawer(
                      //   controller: _drawerController,
                      //   style: DrawerStyle.style1,
                      //   menuScreen: const home1(),
                      //   mainScreen: const home1(),
                      //   borderRadius: 24.0,
                      //   showShadow: false,
                      //   angle: 0.0,
                      //   menuBackgroundColor: Colors.grey.shade100,
                      //   openCurve: Curves.fastOutSlowIn,
                      //   slideWidth: MediaQuery.of(context).size.width * 65,
                      //   closeCurve: Curves.bounceIn,
                      // );
                    },
                  );
                  // ZoomDrawer(
                  //   controller: _drawerController,
                  //   style: DrawerStyle.style1,
                  //   menuScreen: home1(),
                  //   mainScreen: home1(),
                  //   borderRadius: 24.0,
                  //   showShadow: false,
                  //   angle: 0.0,
                  //   menuBackgroundColor: Colors.grey.shade100,
                  //   openCurve: Curves.fastOutSlowIn,
                  //   slideWidth: MediaQuery.of(context).size.width * 2,
                  //   closeCurve: Curves.bounceIn,
                  // );
                },
                child: const SizedBox(
                  height: 52,
                  width: 52,
                  child: CircleAvatar(
                    //backgroundColor: Colors.greenAccent[400],
                    backgroundImage:
                    AssetImage('assets/circleavtarimage.png'),
                    radius: 25,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_rounded,
                    color: Color(0xff1F75EC),
                  ),
                   const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "London,",
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Gilroy'),
                  ),
                  Text(
                    "UK",
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        fontFamily: 'Gilroy'),
                  ),
                   const SizedBox(
                    width: 5,
                  ),
                   const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.blue),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const notification(),
                    ),
                  );
                },
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: SizedBox(
                    height: 52,
                    width: 52,
                    child: CircleAvatar(
                      backgroundColor: notifire.notificationbackground,
                      // ignore: sort_child_properties_last
                      child: Image.asset(
                        'assets/Notification.png',
                        height: 20,
                        color: notifire.backbuttoniconColor,
                      ),
                      radius: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                 child: TextField(
                   controller: search,
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
                     hintText: 'Enter you want to explore...',
                     labelText: "SEARCH",
                     labelStyle:TextStyle(color: notifire.getdarkscolor,fontFamily: "gilroy"),
                       prefixIcon:
                       Image.asset("assets/Searchexplore.png", scale: 24,color:notifire.backbuttoniconColor,),
                   ),
                 ),
              ),
              const SizedBox(
                height: 24,
              ),
              Stack(
                children: [
                  Container(
                    //height: 151,
                    padding: const EdgeInsets.all(24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                     // color: Colors.red,
                      image: const DecorationImage(
                          image: AssetImage("assets/dubaiexplore.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Discover more in",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,fontFamily: 'Gilroy'),
                        ),
                        const Text(
                          "Dubai",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,fontFamily: 'Gilroy'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 41,
                          width: 143,
                          child: FloatingActionButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(51),
                            ),
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'Keep exploring',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xff1F75EC),fontFamily: 'Gilroy'
                              ),
                            ),
                            backgroundColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Best Destination",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:notifire.getdarkscolor,fontFamily: 'Gilroy'
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const explorepageseeallbestdestination(),
                            ),
                          );
                        },
                        child:  Text(
                          "SEE ALL",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color:notifire.greytextColor,fontFamily: 'Gilroy'
                          ),
                        ),
                      ),
                       Icon(
                        Icons.arrow_forward_ios_outlined,
                        color:notifire.greytextColor,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
             // SizedBox(height: 4),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const bestDeals(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 175,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: bestdestinations.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    height: 115,
                                    width: 115,
                                    // ignore: sort_child_properties_last
                                    child: Image.network(
                                      '${bestdestinations[index].image}',
                                      fit: BoxFit.cover,
                                      height: 58,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    "${bestdestinations[index].name}",
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,fontFamily: 'Gilroy'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Best Deals",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: notifire.getdarkscolor,fontFamily: 'Gilroy'
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const explorepageseeallbestdeals(),
                            ),
                          );
                        },
                        child:  Text(
                          "SEE ALL",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: notifire.greytextColor,fontFamily: 'Gilroy'
                          ),
                        ),
                      ),
                       Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: notifire.greytextColor,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
              //SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(16)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestdeals.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // color: Colors.greenAccent[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        height: 302,
                        width: 275,
                        decoration: BoxDecoration(
                          color: notifire.notificationbackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const bestDeals(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 8, right: 8),
                                    height: 140,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      //color: Colors.black,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        '${bestdeals[index].image1}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    margin: const EdgeInsets.only(top: 18, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white.withOpacity(0.5),
                                      image: const DecorationImage(
                                        image: AssetImage("assets/Heart.png"),
                                        scale: 32,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 15, sigmaY: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 18),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Text(
                                        "Cabcum",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color:notifire.getdarkscolor,fontFamily: 'Gilroy'
                                        ),
                                      ),
                                      Text(
                                        "Free",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: notifire.greytextColor,fontFamily: 'Gilroy'
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              "assets/Locationexplore.png",
                                              scale: 28),
                                           Text(
                                            "Lambok, USA",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color:notifire.greytextColor,fontFamily: 'Gilroy'
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\$120",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                                color: notifire.getdarkscolor,fontFamily: 'Gilroy'),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Deals by Month",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:notifire.getdarkscolor,fontFamily: 'Gilroy'
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const explorepageseealldealsbymonth(),
                            ),
                          );
                        },
                        child:  Text(
                          "SEE ALL",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: notifire.greytextColor,fontFamily: 'Gilroy'
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: notifire.greytextColor,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
              //const SizedBox(height: 12),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const bestDeals(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dealsbymonth.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                    height: 115,
                                    width: 115,
                                    // ignore: sort_child_properties_last
                                    child: Image.network(
                                      '${dealsbymonth[index].image2}',
                                      fit: BoxFit.cover,
                                      height: 58,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    "${dealsbymonth[index].name2}",
                                    style: TextStyle(
                                        color:notifire.getdarkscolor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,fontFamily: 'Gilroy'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class List1 {
  String? image;
  String? name;

  List1({this.image, this.name});
}

class List2 {
  String? image1;
  String? name1;

  List2({this.image1, this.name1});
}

class List3 {
  String? image2;
  String? name2;

  List3({this.image2, this.name2});
}
