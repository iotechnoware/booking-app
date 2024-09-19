// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:get/get.dart';
import 'package:gofly/explorepagebestdeals.dart';
import 'package:gofly/homepageseeallbestdestination.dart';
import 'package:gofly/homepageseealldealsbymonth.dart';
import 'package:gofly/homepageseeallexplore.dart';
import 'package:gofly/homepageseeallpopularplace.dart';
import 'package:gofly/homepagesseeallbestdeals.dart';
import 'package:gofly/old_file/notificationmain.dart';
import 'package:gofly/old_file/profilepage.dart';
import 'package:gofly/searchflight.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/custom_widgets/best_deals_widget.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_card_widget.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_title_widget.dart';
import 'package:gofly/ui/views/notification_view/notification_view.dart';
import 'package:gofly/ui/views/profile_view/profile_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

// ignore: camel_case_types
class _HomePageViewState extends State<HomePageView> with TickerProviderStateMixin {
  //int _selectedIndex = 0;

  // late TabController tabController;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  List<List1> image = [
    List1(image: "assets/old_images/planehomehigh.png", name: "Flight"),
    List1(image: "assets/old_images/hotelhommepagehigh.png", name: "Hotel"),
    List1(image: "assets/old_images/cabhomepagehigh.png", name: "Cab"),
  ];
  List<String> items = [
    'England',
    'USA',
    'India',
    'Pakistan',
    'Canada',
    'Germany',
    'Afghanistan',
    'South Africa',
  ];

  String? selectedValue;

  List<List2> popularplace = [
    List2(
        image1:
        "https://images.unsplash.com/photo-1665049628888-c80b95a107d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"),
    List2(
        image1:
        "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg"),
    List2(
        image1:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU"),
  ];

  List<List3> explore = [
    List3(
        image3:
        "https://images.unsplash.com/photo-1569165003085-e8a1066f1cb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2371&q=80",
        name3: "Romania"),
    List3(
        image3:
        "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg",
        name3: "Italy"),
    List3(
        image3:
        "https://images.unsplash.com/photo-1580837119756-563d608dd119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name3: "Russia"),
    List3(
        image3:
        "https://images.unsplash.com/photo-1523978591478-c753949ff840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name3: "Norway"),
    List3(
        image3:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU",
        name3: "England"),
    List3(
        image3:
        "https://images.unsplash.com/photo-1548678967-f1aec58f6fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JlZWNlJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
        name3: "Greece"),
  ];

  List<List4> bestdestinations = [
    List4(
        image4:
        "https://images.unsplash.com/photo-1569165003085-e8a1066f1cb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2371&q=80",
        name4: "Family Trip"),
    List4(
        image4:
        "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg",
        name4: "Longer Trip"),
    List4(
        image4:
        "https://images.unsplash.com/photo-1580837119756-563d608dd119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name4: "Shorter Trip"),
    List4(
        image4:
        "https://images.unsplash.com/photo-1523978591478-c753949ff840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name4: "Norway"),
    List4(
        image4:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU",
        name4: "England"),
    List4(
        image4:
        "https://images.unsplash.com/photo-1548678967-f1aec58f6fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JlZWNlJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
        name4: "Greece"),
  ];

  List<List5> bestdeals = [
    List5(
        image5:
        "https://images.unsplash.com/photo-1569165003085-e8a1066f1cb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2371&q=80",
        name5: "Family Trip"),
    List5(
        image5:
        "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg",
        name5: "Longer Trip"),
    List5(
        image5:
        "https://images.unsplash.com/photo-1580837119756-563d608dd119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name5: "Shorter Trip"),
    List5(
        image5:
        "https://images.unsplash.com/photo-1523978591478-c753949ff840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name5: "Norway"),
    List5(
        image5:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU",
        name5: "England"),
    List5(
        image5:
        "https://images.unsplash.com/photo-1548678967-f1aec58f6fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JlZWNlJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
        name5: "Greece"),
  ];

  List<List6> dealsbymonth = [
    List6(
        image6:
        "https://images.unsplash.com/photo-1569165003085-e8a1066f1cb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2371&q=80",
        name6: "January"),
    List6(
        image6:
        "https://media.cntraveler.com/photos/5cc2336031a2ae73ce6fb4df/master/w_4000,h_2667,c_limit/New-York_GettyImages-688899871.jpg",
        name6: "Fabruary"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1580837119756-563d608dd119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name6: "March"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1523978591478-c753949ff840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
        name6: "April"),
    List6(
        image6:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz1-beyvRXZ5BAncq7fLvfxVSzuux-gYaeT91aX7UpfN7JwILtx9-G8Ze6dPnSAhq8eD4&usqp=CAU",
        name6: "May"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1548678967-f1aec58f6fb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Z3JlZWNlJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
        name6: "June"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1503152394-c571994fd383?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3540&q=80",
        name6: "July"),
    List6(
        image6:
        "https://media.istockphoto.com/photos/london-in-autumn-time-concept-with-a-person-holding-a-british-in-picture-id1348042661?s=612x612",
        name6: "August"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3383&q=80",
        name6: "September"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1533105079780-92b9be482077?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80",
        name6: "October"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80",
        name6: "November"),
    List6(
        image6:
        "https://images.unsplash.com/photo-1552733407-5d5c46c3bb3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHRyYXZlbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
        name6: "December"),
  ];

  // final _drawerController = ZoomDrawerController();
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: notifire.backgroundallscreenColor,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          // reverse: true,
          child: Padding(
            padding: const EdgeInsets.only(right: 12,left: 12 ,top: 20 , bottom: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hi,',
                      style: TextStyle(
                          fontSize: 24,
                          color: notifire.getdarkscolor,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Gilroy'),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Percy',
                      style: TextStyle(
                          fontSize: 24,
                          color: notifire.getdarkscolor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Let's discover a new adventure.",
                  style: TextStyle(
                      color: notifire.greytextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Gilroy'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const searchflight(),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 55,
                          width: 145,
                          child: Card(
                            color: notifire.notificationbackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(left: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                      color:
                                      notifire.homepagebookingsectionmain,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "${image[index].image}",
                                          ),
                                          scale: 20),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  const SizedBox(width: 18),
                                  Text(
                                    "${image[index].name}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: notifire.getdarkscolor,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Gilroy'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTitleWidget(
                  title: 'Popular place',
                  onPressed: (){Get.to(const homepageseeallpopularplace());},
                ),
                const SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const bestDeals(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 310,
                    decoration: BoxDecoration(
                      //color: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularplace.length,
                      itemBuilder: (context, index) {
                        return Card(
                          //elevation: 0,
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
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: 220,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    //color: Colors.black,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      '${popularplace[index].image1}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ListTile(
                                      title: Text(
                                        "The Colosseum",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getdarkscolor,
                                            fontSize: 14,
                                            fontFamily: 'Gilroy'),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Image.asset(
                                              "assets/old_images/Locationexplore.png",
                                              scale: 28),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "Lambok,",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: notifire.greytextColor,
                                                fontSize: 12,
                                                fontFamily: 'Gilroy'),
                                          ),
                                          Text(
                                            "USA",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: notifire.greytextColor,
                                                fontSize: 12,
                                                fontFamily: 'Gilroy'),
                                          ),
                                        ],
                                      ),
                                      trailing: Image.asset(
                                          "assets/old_images/Heartpopularlist.png",
                                          color: notifire.backbuttoniconColor,
                                          scale: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTitleWidget(
                  title: 'Explore',
                  onPressed: (){Get.to(const homepageseeallexplore());},
                ),
                //const SizedBox(height: 12,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const bestDeals(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: explore.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  // ignore: sort_child_properties_last
                                  child: Image.network(
                                    '${explore[index].image3}',
                                    fit: BoxFit.cover,
                                    height: 58,
                                  ),
                                  radius: 29,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Text(
                                  "${explore[index].name3}",
                                  style: TextStyle(
                                      color: notifire.getdarkscolor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontFamily: 'Gilroy'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                CustomTitleWidget(
                  title: 'Best Destination',
                  onPressed: (){Get.to(const homepageseeallbestdestination());},
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const bestDeals(),
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
                        return CustomCardWidget(
                            name: '${bestdestinations[index].name4}',
                            imageUrl: '${bestdestinations[index].image4}'
                        );
                      },
                    ),
                  ),
                ),

                CustomTitleWidget(
                    title: 'Best Deals',
                    onPressed: (){Get.to(const homepagesseeallbestdeals());},
                ),

                //SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const bestDeals(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      //color: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bestdeals.length,
                      itemBuilder: (context, index) {
                        return BestDealsWidget(
                          name: 'Cabcum',
                          imageUrl: '${bestdeals[index].image5}',
                          location: 'Lambok , USA',
                          price: '120',
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                CustomTitleWidget(
                  title: 'Best by month',
                  onPressed: (){Get.to(const homepageseealldealsbymonth());},
                ),
                // SizedBox(height:12),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const bestDeals(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 175,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: dealsbymonth.length,
                      itemBuilder: (context, index) {
                        return CustomCardWidget(
                            name: '${dealsbymonth[index].name6}',
                            imageUrl: '${dealsbymonth[index].image6}'
                        );
                      },
                    ),
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

class List1 {
  String? image;
  String? name;

  List1({this.image, this.name});
}

class List2 {
  String? image1;

  //String? name1;

  List2({
    this.image1,
    //this.name1
  });
}

class List3 {
  String? image3;
  String? name3;

  List3({this.image3, this.name3});
}

class List4 {
  String? image4;
  String? name4;

  List4({this.image4, this.name4});
}

class List5 {
  String? image5;
  String? name5;

  List5({this.image5, this.name5});
}

class List6 {
  String? image6;
  String? name6;

  List6({this.image6, this.name6});
}
