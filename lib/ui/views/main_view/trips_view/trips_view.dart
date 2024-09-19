// ignore_for_file: camel_case_types

import 'package:get/get.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:gofly/tripsdetailsdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_container_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TripsView extends StatefulWidget {
  const TripsView({Key? key}) : super(key: key);

  @override
  State<TripsView> createState() =>
      _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
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
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor:notifire.backgroundallscreenColor,
        elevation:0,
        title:Text(
          "Your booking",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: notifire.getdarkscolor,
              fontFamily: 'Gilroy'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: ListView(
          children: [

            CustomContainerWidget(
              onPressed: (){Get.to(const tripsdetailpage());},
              title: 'London -> California',
              subTitle: 'Activity on Wed, Dec 1 at 11:00 am',
              imageUrl: 'boardingpassiconfirm',
            ),

            CustomContainerWidget(
              onPressed: (){Get.to(const tripsdetailpage());},
              title: 'Hotel Palace',
              subTitle: 'Check in Wed ,Dec 1',
              imageUrl: 'hoteltrips',
            ),

            CustomContainerWidget(
              onPressed: (){Get.to(const tripsdetailpage());},
              title: 'London -> California',
              subTitle: 'Activity on Wed, Dec 1 at 11:00 am',
              imageUrl: 'boardingpassiconfirm',
            ),

            CustomContainerWidget(
              onPressed: (){Get.to(const tripsdetailpage());},
              title: 'Hotel Palace',
              subTitle: 'Check in Wed ,Dec 1',
              imageUrl: 'hoteltrips',
            ),
          ],
        ),
      ),
    );
  }
}
