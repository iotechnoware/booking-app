// ignore_for_file: duplicate_import

import 'dart:ui';
import 'package:get/get.dart';
import 'package:gofly/explorepagebestdeals.dart';
import 'package:gofly/explorepageseeallbestdeals.dart';
import 'package:gofly/explorepageseeallbestdestination.dart';
import 'package:gofly/explorepageseealldealsbymonth.dart';
import 'package:gofly/old_file/notificationmain.dart';
import 'package:gofly/old_file/profilepage.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/custom_widgets/best_deals_widget.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_card_widget.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_title_widget.dart';
import 'package:gofly/ui/views/notification_view/notification_view.dart';
import 'package:gofly/ui/views/profile_view/profile_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



// ignore: camel_case_types
class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() =>
      _ExploreViewState();
}

// ignore: camel_case_types
class _ExploreViewState
    extends State<ExploreView> {
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
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 18, left: 20, right: 20 , bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: search,
                hitText: 'SEARCH',
                labelText: 'Enter You Wont To Explore ....',
                iconImage: 'Searchexplore',
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
                          image: AssetImage("assets/old_images/dubaiexplore.jpg"),
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
              CustomTitleWidget(
                title: 'Best Destination',
                onPressed: (){Get.to(const explorepageseeallbestdestination());},
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
                          return CustomCardWidget(
                              name: '${bestdestinations[index].name}',
                              imageUrl: '${bestdestinations[index].image}',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              CustomTitleWidget(
                title: 'Best Deals',
                onPressed: (){Get.to(const explorepageseeallbestdeals());},
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
                    return BestDealsWidget(
                        name: 'Cabcum',
                        imageUrl: '${bestdeals[index].image1}',
                        location: 'Lambak, USA',
                        price: '120',
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              CustomTitleWidget(
                title: 'Deals by month',
                onPressed: (){Get.to(const explorepageseealldealsbymonth());},
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
                          return CustomCardWidget(
                              name: '${dealsbymonth[index].name2}',
                              imageUrl: '${dealsbymonth[index].image2}',
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
