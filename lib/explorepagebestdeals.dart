import 'dart:ui';
import 'package:gofly/explorepagenearbyhotel.dart';
import 'package:gofly/old_file/explorepageofnavigationbar.dart';
import 'package:gofly/explorepagetopdeals.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/views/main_view/explore_view/explore_view.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class bestDeals extends StatefulWidget {
  const bestDeals({Key? key}) : super(key: key);

  get text => "";

  @override
  State<bestDeals> createState() => _bestDealsState();
}

// ignore: camel_case_types
class _bestDealsState extends State<bestDeals> {

  @override
  void initState() {
    super.initState();
  }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: FloatingActionButton.extended(
            label: const Text(
              "SEE FLIGHTS",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,fontFamily: 'Gilroy'),
            ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.blueAccent.shade400,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const topdeals(),
                ),
              );
            },
          ),
        ),
      ),
      //appBar: SliverAppBar,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const ExploreView(),
                      ),
                    );
                  },
                  child: Container(
                    height: 44,
                    width: 44,
                    margin: const EdgeInsets.only(top:12,left: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:Colors.grey.shade200.withOpacity(0.4),
                      image: const DecorationImage(
                        image: AssetImage("assets/old_images/backwhite.png"),
                        scale: 32,
                      ),
                    ),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 44,
                  width: 44,
                  margin: const EdgeInsets.only(top:12,right: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade200.withOpacity(0.4),
                    image: const DecorationImage(
                      image: AssetImage("assets/old_images/Heart.png"),
                      scale: 26,
                    ),
                  ),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            expandedHeight: 305,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Container(
                  //   height: ,
                  //   width: double.infinity,
                  //   color: Colors.red,
                  // ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            "assets/old_images/dubaipalm.jpg",
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),),
                  Positioned(
                    bottom: 1,
                    left: 34,
                    child: Container(
                      height: 66,
                      width: 220,
                      padding: const EdgeInsets.only(left: 16, top: 12, right: 12),
                      // margin: EdgeInsets.only(top:295, left: 34),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 0,
                                blurRadius: 8)
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color:notifire.notificationbackground),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Palm Jumairah",
                            style: TextStyle(color: notifire.getdarkscolor,
                                fontSize: 16, fontWeight: FontWeight.w600,fontFamily: 'Gilroy'),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Image.asset("assets/old_images/Locationexplore.png",
                                  scale: 28),
                              const Text(
                                "Dubai, UAE",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffAEB4B9),fontFamily: 'Gilroy'
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, left: 5, right: 5, bottom: 2),
                                child: Container(
                                  height: 3,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xff848D94),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Color(0xffFCB26D),
                                size: 15,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "4.2 (3k)",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffAEB4B9),fontFamily: 'Gilroy'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Duration",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffAEB4B9),fontFamily: 'Gilroy'
                            ),
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                size: 15.42,
                                color: Color(0xff909CA7),
                              ),
                              const SizedBox(width: 10.29),
                              Text(
                                "5 Days",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color:notifire.getdarkscolor,fontFamily: 'Gilroy'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Visitor",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffAEB4B9),fontFamily: 'Gilroy'
                            ),
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              Image.asset("assets/old_images/Group 3bestdealss.png",
                                  scale: 38),
                              const SizedBox(width: 8),
                              Text(
                                "1200 Person",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color:notifire.getdarkscolor,fontFamily: 'Gilroy'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Distance",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffAEB4B9),fontFamily: 'Gilroy'
                            ),
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: [
                              Image.asset("assets/old_images/Send.png", scale: 38),
                              const SizedBox(width: 8),
                              Text(
                                "567 KM",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color:notifire.getdarkscolor,fontFamily: 'Gilroy'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ReadMoreText(
                      'As the first export to be held in the Middle East, Africa and South Asia, Expo 2020,As the first export to be held in the Middle East, Africa and South Asia, Expo 2020',
                      trimLines: 2,
                      //preDataText: "AMANDA",
                      preDataTextStyle:
                          const TextStyle(fontWeight: FontWeight.w400, fontSize: 14,fontFamily: 'Gilroy'),
                      style: TextStyle(
                        color:notifire.greytextColor,
                          fontFamily: 'Gilroy'
                      ),
                      colorClickableText: const Color(0xff1F75EC),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'See more',
                      trimExpandedText: ' See less',
                      moreStyle: const TextStyle(
                          color: Color(0xff1F75EC),
                          decoration: TextDecoration.underline,fontFamily: 'Gilroy'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "Nearby Hotel",
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
                                        const nearbyhotel(),
                                  ),
                                );
                              },
                              child: const Text(
                                "SEE ALL",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color:Colors.grey,fontFamily: 'Gilroy'
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color:Colors.grey,
                              size: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 230,
                    //padding: EdgeInsets.only(left: 21),
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
                            width: 252,
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
                                            top: 10, left: 8, right: 8),
                                        height: 140,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          //color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                        margin:
                                            const EdgeInsets.only(top: 18, right: 16),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.white.withOpacity(0.5),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/old_images/Heart22explore.png"),
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
                                          const Text(
                                            "Free",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffAEB4B9),fontFamily: 'Gilroy'
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
                                                  "assets/old_images/Locationexplore.png",
                                                  scale: 28),
                                              const Text(
                                                "Lambok, USA",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xffAEB4B9),fontFamily: 'Gilroy'
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
                                                    color:notifire.getdarkscolor,fontFamily: 'Gilroy'),
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
                  const SizedBox(height: 300),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class List2 {
  String? image1;
  String? name1;

  List2({this.image1, this.name1});
}
