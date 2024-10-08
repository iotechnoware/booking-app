import 'dart:ui';

import 'package:gofly/old_file/explorepageofnavigationbar.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/views/main_view/explore_view/explore_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class nearbyhotel extends StatefulWidget {
  const nearbyhotel({Key? key}) : super(key: key);

  @override
  State<nearbyhotel> createState() => _nearbyhotelState();
}

// ignore: camel_case_types
class _nearbyhotelState extends State<nearbyhotel> {
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
        elevation: 0,
        centerTitle: true,
        backgroundColor:notifire.backgroundallscreenColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const ExploreView(),
                ),
              );
            },
            child:  Padding(
              padding: const EdgeInsets.only(bottom: 4,top: 8),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(color:notifire.backbuttonborderColor),
                    borderRadius: BorderRadius.circular(16)),
                alignment: Alignment.center,
                child: Center(
                  child: IconButton(
                    icon:  Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color:notifire.backbuttoniconColor,
                    ),
                    iconSize: 14,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const ExploreView(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        title:  Text(
          "Nearby Hotels",
          style: TextStyle(
              color:notifire.getdarkscolor, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Gilroy'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          width: double.infinity,
          //height: 300,
          // padding: EdgeInsets.only(left: 9,right: 9,top: 9),
          decoration: BoxDecoration(
              color:notifire.backgroundallscreenColor, borderRadius: BorderRadius.circular(16)),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: bestdeals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Card(
                  elevation: 0,
                  // color: Colors.greenAccent[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    height: 232,
                    width: 275,
                    decoration: BoxDecoration(
                      color:notifire.notificationbackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => bestDeals(),
                                //   ),
                                // );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 9, right: 9),
                                height: 145,
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
                                height: 38,
                                width: 38,
                                margin: const EdgeInsets.only(top: 18, right: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade200.withOpacity(0.4),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/old_images/Heart.png"),
                                    scale: 32,
                                  ),
                                ),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    "Cabcum",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor,
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffFCB26D),
                                        size: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Padding(
                                        padding: EdgeInsets.only(top:4),
                                        child: Text(
                                          "4.2",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,fontFamily: 'Gilroy',
                                            color: Color(0xffAEB4B9),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/old_images/Locationexplore.png",
                                          scale: 24),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      const Text(
                                        "Lambok, USA",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children:  [
                                      Text(
                                        "\$120/",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,fontFamily: 'Gilroy',
                                            color: notifire.getdarkscolor),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Text(
                                          "night",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,fontFamily: 'Gilroy',
                                            color: Color(0xffAEB4B9),
                                          ),
                                        ),
                                      ),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class List2 {
  String? image1;
  String? name1;

  List2({this.image1, this.name1});
}
