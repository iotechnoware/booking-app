import 'package:gofly/confirmation.dart';
import 'package:gofly/explorepageofnavigationbar.dart';
import 'package:gofly/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class topdeals extends StatefulWidget {
  const topdeals({Key? key}) : super(key: key);

  @override
  State<topdeals> createState() => _topdealsState();
}

// ignore: camel_case_types
class _topdealsState extends State<topdeals> {

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
                      const explorepageofnavigationbar(),
                ),
              );
            },
            child: Padding(
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
                          const explorepageofnavigationbar(),
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
          "Top deals to Dubai",
          style: TextStyle(
              color:notifire.getdarkscolor, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Gilroy'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                  const confirmpage(),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Text(
                        "Next 2 weeks",
                        style: TextStyle(color: notifire.getdarkscolor,fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Gilroy'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Container(
                    height: 185,
                    padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:notifire.notificationbackground,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                             Text(
                              "jan 04",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                  color:notifire.getdarkscolor),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                  //color: Colors.indigo.shade50,
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: SizedBox(
                                height: 6,
                                width: 6,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color:notifire.getdarkscolor,
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 24,
                                      child: LayoutBuilder(
                                        builder:
                                            (context, constraints) {
                                          return Flex(
                                            // ignore: sort_child_properties_last
                                            children: List.generate(
                                              (constraints.constrainWidth() /
                                                  10)
                                                  .floor(),
                                                  (index) => SizedBox(
                                                height: 1.5,
                                                width: 5,
                                                child: DecoratedBox(
                                                  decoration:
                                                  BoxDecoration(
                                                      color:notifire.backbuttonborderColor),
                                                ),
                                              ),
                                            ),
                                            direction: Axis.horizontal,
                                            mainAxisSize:
                                            MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                          );
                                        },
                                      ),
                                    ),
                                    Center(
                                      child: Transform.rotate(
                                        angle: 1.5,
                                        child: const Icon(
                                          Icons.local_airport,
                                          color: Colors.amber,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                 // color: Colors.indigo.shade50,
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: SizedBox(
                                height: 6,
                                width: 6,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: notifire.getdarkscolor,
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 13),
                             Text(
                              "jan 09",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                  color:notifire.getdarkscolor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Tue-Sun,",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                      color: Color(0xffAEB4B9)),
                                ),
                                SizedBox(width: 2,),
                                Text(
                                  "5 nights",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                      color: Color(0xffAEB4B9)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                 Image.asset("assets/returnexxplore.png",scale: 40),
                                const SizedBox(width:6),
                                const Text(
                                  "Non-stop",
                                  style: TextStyle(
                                      fontSize: 12,fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffAEB4B9)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Divider(thickness: 1,color: notifire.backbuttonborderColor),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                             Text(
                              "jan 12",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                  color:notifire.getdarkscolor),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                 // color: Colors.indigo.shade50,
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: SizedBox(
                                height: 6,
                                width: 6,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color:notifire.getdarkscolor,
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 24,
                                      child: LayoutBuilder(
                                        builder:
                                            (context, constraints) {
                                          return Flex(
                                            // ignore: sort_child_properties_last
                                            children: List.generate(
                                              (constraints.constrainWidth() /
                                                  10)
                                                  .floor(),
                                                  (index) => SizedBox(
                                                height: 1.5,
                                                width: 5,
                                                child: DecoratedBox(
                                                  decoration:
                                                  BoxDecoration(
                                                      color:notifire.backbuttonborderColor),
                                                ),
                                              ),
                                            ),
                                            direction: Axis.horizontal,
                                            mainAxisSize:
                                            MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                          );
                                        },
                                      ),
                                    ),
                                    Center(
                                      child: Transform.rotate(
                                        angle: 1.5,
                                        child: const Icon(
                                          Icons.local_airport,
                                          color: Colors.amber,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                           // SizedBox(width: 13,),
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey),
                                  //color: Colors.indigo.shade50,
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: SizedBox(
                                height: 6,
                                width: 6,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color:notifire.getdarkscolor,
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 17),
                            Text(
                              "jan 17",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                  color:notifire.getdarkscolor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Wed-Sun",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                      color: Color(0xffAEB4B9)),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  "5 nights",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                      color: Color(0xffAEB4B9)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset("assets/returnexxplore.png",scale: 40),
                                const SizedBox(width:6),
                                const Text(
                                  "Non-stop",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                      color: Color(0xffAEB4B9)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Row(
                        children: [
                          Text(
                            "Next 4 weeks",
                            style: TextStyle(color: notifire.getdarkscolor,fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Gilroy'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        height: 185,
                        padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:notifire.notificationbackground,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "jan 04",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      //color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color:notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 24,
                                          child: LayoutBuilder(
                                            builder:
                                                (context, constraints) {
                                              return Flex(
                                                // ignore: sort_child_properties_last
                                                children: List.generate(
                                                  (constraints.constrainWidth() /
                                                      10)
                                                      .floor(),
                                                      (index) => SizedBox(
                                                    height: 1.5,
                                                    width: 5,
                                                    child: DecoratedBox(
                                                      decoration:
                                                      BoxDecoration(
                                                          color:notifire.backbuttonborderColor),
                                                    ),
                                                  ),
                                                ),
                                                direction: Axis.horizontal,
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                              );
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: Transform.rotate(
                                            angle: 1.5,
                                            child: const Icon(
                                              Icons.local_airport,
                                              color: Colors.amber,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      // color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Text(
                                  "jan 09",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Tue-Sun,",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                    SizedBox(width: 2,),
                                    Text(
                                      "5 nights",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/returnexxplore.png",scale: 40),
                                    const SizedBox(width:6),
                                    const Text(
                                      "Non-stop",
                                      style: TextStyle(
                                          fontSize: 12,fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Divider(thickness: 1,color: notifire.backbuttonborderColor),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "jan 12",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                                const SizedBox(
                                  width: 17,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      // color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color:notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 24,
                                          child: LayoutBuilder(
                                            builder:
                                                (context, constraints) {
                                              return Flex(
                                                // ignore: sort_child_properties_last
                                                children: List.generate(
                                                  (constraints.constrainWidth() /
                                                      10)
                                                      .floor(),
                                                      (index) => SizedBox(
                                                    height: 1.5,
                                                    width: 5,
                                                    child: DecoratedBox(
                                                      decoration:
                                                      BoxDecoration(
                                                          color:notifire.backbuttonborderColor),
                                                    ),
                                                  ),
                                                ),
                                                direction: Axis.horizontal,
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                              );
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: Transform.rotate(
                                            angle: 1.5,
                                            child: const Icon(
                                              Icons.local_airport,
                                              color: Colors.amber,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 13,),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      //color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color:notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 17),
                                Text(
                                  "jan 17",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Wed-Sun",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "5 nights",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/returnexxplore.png",scale: 40),
                                    const SizedBox(width:6),
                                    const Text(
                                      "Non-stop",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Row(
                        children: [
                          Text(
                            "Next 2 months",
                            style: TextStyle(color: notifire.getdarkscolor,fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Gilroy'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        height: 185,
                        padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color:notifire.notificationbackground,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "jan 04",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      //color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color:notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 24,
                                          child: LayoutBuilder(
                                            builder:
                                                (context, constraints) {
                                              return Flex(
                                                // ignore: sort_child_properties_last
                                                children: List.generate(
                                                  (constraints.constrainWidth() /
                                                      10)
                                                      .floor(),
                                                      (index) => SizedBox(
                                                    height: 1.5,
                                                    width: 5,
                                                    child: DecoratedBox(
                                                      decoration:
                                                      BoxDecoration(
                                                          color:notifire.backbuttonborderColor),
                                                    ),
                                                  ),
                                                ),
                                                direction: Axis.horizontal,
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                              );
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: Transform.rotate(
                                            angle: 1.5,
                                            child: const Icon(
                                              Icons.local_airport,
                                              color: Colors.amber,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      // color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Text(
                                  "jan 09",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Tue-Sun,",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                    SizedBox(width: 2,),
                                    Text(
                                      "5 nights",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/returnexxplore.png",scale: 40),
                                    const SizedBox(width:6),
                                    const Text(
                                      "Non-stop",
                                      style: TextStyle(
                                          fontSize: 12,fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Divider(thickness: 1,color: notifire.backbuttonborderColor),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "jan 12",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                                const SizedBox(
                                  width: 17,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      // color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color:notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 24,
                                          child: LayoutBuilder(
                                            builder:
                                                (context, constraints) {
                                              return Flex(
                                                // ignore: sort_child_properties_last
                                                children: List.generate(
                                                  (constraints.constrainWidth() /
                                                      10)
                                                      .floor(),
                                                      (index) => SizedBox(
                                                    height: 1.5,
                                                    width: 5,
                                                    child: DecoratedBox(
                                                      decoration:
                                                      BoxDecoration(
                                                          color:notifire.backbuttonborderColor),
                                                    ),
                                                  ),
                                                ),
                                                direction: Axis.horizontal,
                                                mainAxisSize:
                                                MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                              );
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: Transform.rotate(
                                            angle: 1.5,
                                            child: const Icon(
                                              Icons.local_airport,
                                              color: Colors.amber,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 13,),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      //color: Colors.indigo.shade50,
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: SizedBox(
                                    height: 6,
                                    width: 6,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color:notifire.getdarkscolor,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 17),
                                Text(
                                  "jan 17",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,fontFamily: 'Gilroy',
                                      color:notifire.getdarkscolor),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Wed-Sun",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "5 nights",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/returnexxplore.png",scale: 40),
                                    const SizedBox(width:6),
                                    const Text(
                                      "Non-stop",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
                                          color: Color(0xffAEB4B9)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
