import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofly/searchflightroundtripssearchbar.dart';
import 'package:gofly/selectflightfilterandshort.dart';
import 'package:gofly/ui/shared/utils.dart';
import 'package:gofly/ui/views/search_flight_view/api_server.dart';
import 'package:gofly/ui/views/search_flight_view/price_view.dart';
import 'package:gofly/ui/views/search_flight_view/search_flight_controller.dart';
import 'package:gofly/ui/views/search_flight_view/suggestions_controller.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class FlightInfoPage extends StatefulWidget {
  const FlightInfoPage({super.key,});



  @override
  _FlightInfoPageState createState() => _FlightInfoPageState();
}

class _FlightInfoPageState extends State<FlightInfoPage> {

  SearchFlightController controller = Get.put(SearchFlightController());
  SuggestionsController suggestionsController = Get.put(SuggestionsController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child:Padding(
              padding: const EdgeInsets.only(bottom: 4, top: 8),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(16)),
                // ignore: sort_child_properties_last
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                    iconSize: 14,
                    color: Colors.black,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            height:36,
            width: 36,
            margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.center,
            child: IconButton(
              icon: Image.asset('assets/old_images/settingsselect.png',scale:2,),
              // iconSize: 24,
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const filterandshortmain(),
                  ),
                );
              },
            ),
          ),
        ],
        // centerTitle: true,
        backgroundColor: const Color(0xffF9FAFB),
        automaticallyImplyLeading: false,
        title:  const Text(
          "Search flight",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,fontFamily: 'Gilroy',
              fontSize: 18),
        ),
      ),


      body: Obx(() {
        return controller.isResultLoading ? const Center(
            child: CircularProgressIndicator()) : controller.resultList.isEmpty ?
        Center(child: Lottie.asset('assets/lottie/no_flight_found.json' , width: screenWidth(3) , height: screenWidth(3))) :
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsetsDirectional.only(top: 12 , bottom: 10 , start: 10),
                child: Text('Flight Found : ${controller.resultList.length}',
                style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 16),
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.resultList.length,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  final offers = controller.resultList[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 10, left: 10),
                    child: InkWell(
                      onTap: (){
                        controller.getPricing(offers);
                        Get.to(const PriceView());
                      },
                      child: Container(
                        width: 100,
                        // height: screenWidth(2.5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 2),
                                  blurRadius: 1
                              ),
                            ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 12, left: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    offers['itineraries'][0]['segments'][0]['carrierCode'] ?? '',
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline),),
                                  Text(
                                    '\$ ${offers['price']['total']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: screenWidth(20)),

                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [

                                  Text(
                                    DateFormat('h:mm a').format(DateTime.parse(
                                        offers['itineraries'][0]['segments'][0]['departure']['at'] ?? '')),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.grey),

                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: SizedBox(
                                        height: 6,
                                        width: 6,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                        ),
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
                                                    (constraints.constrainWidth() / 10).floor(),
                                                        (index) =>
                                                    const SizedBox(
                                                      height: 2,
                                                      width: 5,
                                                      child: DecoratedBox(
                                                        decoration:
                                                        BoxDecoration(
                                                            color: Color(
                                                                0xffDEDEDE)),
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

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: Container(
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
                                              color: Colors.black,
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Text(
                                    DateFormat('h:mm a').format(DateTime.parse(
                                        '${offers['itineraries'][0]['segments'][0]['arrival']['at'] ??
                                            ''}'),
                                    ),)
                                ],
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6, top: 2, bottom: 2),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey.withOpacity(
                                              0.5),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(
                                        child: Text(
                                          offers['itineraries'][0]['segments'][0]['departure']['iataCode'] ??
                                              '',
                                          style: TextStyle(
                                              color: Colors.black.withOpacity(
                                                  0.4)),),
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6, top: 2, bottom: 2),
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey.withOpacity(
                                              0.4),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(
                                        child: Text(
                                          offers['itineraries'][0]['segments'][0]['arrival']['iataCode'] ??
                                              '',
                                          style: TextStyle(
                                              color: Colors.black.withOpacity(
                                                  0.4)),),
                                      )
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 50,),

                            Row(
                              children: List.generate(150 ~/ 6, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
                                      height: 2,
                                    ),
                                  )),
                            ),

                            const SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Container(
                                  // width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.35),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_month_outlined,
                                            size: 15,
                                            color: Colors.grey.withOpacity(
                                                0.99),),
                                          Text(
                                            ' ${DateFormat('MMM-d-y').format(
                                                DateTime.parse(
                                                    offers['itineraries'][0]['segments'][0]['arrival']['at'] ??
                                                        ''))}',
                                            style: TextStyle(
                                                color: Colors.grey.withOpacity(
                                                    0.99)),
                                            // DateFormat('yMMMMd h:mm a').DateTime.parse(flight['departure_at']))
                                          ),
                                        ],
                                      ),
                                    ),)
                                ),


                              ],
                            ),

                            const SizedBox(height: 10),

                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }
      ),
      // Obx(() {
      //   return SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         controller.isProjectsLoading ? const Center(
      //             child: CircularProgressIndicator()) :
      //         ListView.builder(
      //           shrinkWrap: true,
      //           physics: const PageScrollPhysics(),
      //           itemCount: controller.flightList.length,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.only(
      //                   top: 8, bottom: 8, right: 10, left: 10),
      //               child: Container(
      //                 width: 100,
      //                 // height: screenWidth(2.5),
      //                 decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(5),
      //                     boxShadow: const [
      //                       BoxShadow(
      //                           color: Colors.grey,
      //                           offset: Offset(1, 2),
      //                           blurRadius: 1
      //                       ),
      //                     ]
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.only(
      //                           top: 15, right: 12, left: 12),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Text(
      //                             controller.flightList[index].airline ?? '',
      //                             style: const TextStyle(
      //                                 decoration: TextDecoration.underline),),
      //                           Text(
      //                             '\$ ${controller.flightList[index].price}',
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //
      //                     SizedBox(height: screenWidth(20)),
      //
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 8, right: 8),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //
      //                           Text(
      //                             DateFormat('h:mm a').format(DateTime.parse(
      //                                 controller.flightList[index]
      //                                     .departureAt ?? '')),
      //                             // flight['departure_at']
      //                           ),
      //
      //                           Padding(
      //                             padding: const EdgeInsets.only(
      //                                 left: 3, right: 3),
      //                             child: Container(
      //                               padding: const EdgeInsets.all(3),
      //                               decoration: BoxDecoration(
      //                                   border: Border.all(
      //                                       width: 1, color: Colors.grey),
      //                                   //color: Colors.indigo.shade50,
      //                                   borderRadius:
      //                                   BorderRadius.circular(20)),
      //                               child: SizedBox(
      //                                 height: 6,
      //                                 width: 6,
      //                                 child: DecoratedBox(
      //                                   decoration: BoxDecoration(
      //                                       color: Colors.black,
      //                                       borderRadius:
      //                                       BorderRadius.circular(5)),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //
      //                           Expanded(
      //                             child: Padding(
      //                               padding: const EdgeInsets.all(8.0),
      //                               child: Stack(
      //                                 children: <Widget>[
      //                                   SizedBox(
      //                                     height: 24,
      //                                     child: LayoutBuilder(
      //                                       builder:
      //                                           (context, constraints) {
      //                                         return Flex(
      //                                           // ignore: sort_child_properties_last
      //                                           children: List.generate(
      //                                             (constraints
      //                                                 .constrainWidth() /
      //                                                 10)
      //                                                 .floor(),
      //                                                 (index) =>
      //                                             const SizedBox(
      //                                               height: 2,
      //                                               width: 5,
      //                                               child: DecoratedBox(
      //                                                 decoration:
      //                                                 BoxDecoration(
      //                                                     color: Color(
      //                                                         0xffDEDEDE)),
      //                                               ),
      //                                             ),
      //                                           ),
      //                                           direction: Axis.horizontal,
      //                                           mainAxisSize:
      //                                           MainAxisSize.max,
      //                                           mainAxisAlignment:
      //                                           MainAxisAlignment
      //                                               .spaceBetween,
      //                                         );
      //                                       },
      //                                     ),
      //                                   ),
      //                                   Center(
      //                                     child: Transform.rotate(
      //                                       angle: 1.5,
      //                                       child: const Icon(
      //                                         Icons.local_airport,
      //                                         color: Colors.amber,
      //                                         size: 24,
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //
      //                           Padding(
      //                             padding: const EdgeInsets.only(
      //                                 left: 3, right: 3),
      //                             child: Container(
      //                               padding: const EdgeInsets.all(3),
      //                               decoration: BoxDecoration(
      //                                   border: Border.all(
      //                                       width: 1, color: Colors.grey),
      //                                   //color: Colors.indigo.shade50,
      //                                   borderRadius:
      //                                   BorderRadius.circular(20)),
      //                               child: SizedBox(
      //                                 height: 6,
      //                                 width: 6,
      //                                 child: DecoratedBox(
      //                                   decoration: BoxDecoration(
      //                                       color: Colors.black,
      //                                       borderRadius:
      //                                       BorderRadius.circular(5)),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //
      //                           Text(
      //                             // DateFormat('h:mm').format(DateTime.parse(flight['duration_to'])),
      //                               '${controller.flightList[index]
      //                                   .durationTo! ~/ 60}:${controller
      //                                   .flightList[index].durationTo! % 60}'
      //                             // flight['departure_at']
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //
      //
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 5, right: 5),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Container(
      //                               padding: const EdgeInsets.only(
      //                                   left: 6, right: 6, top: 2, bottom: 2),
      //                               decoration: BoxDecoration(
      //                                   color: Colors.blueGrey.withOpacity(0.5),
      //                                   borderRadius: BorderRadius.circular(8)
      //                               ),
      //                               child: Center(
      //                                 child: Text(controller.flightList[index]
      //                                     .originAirport ?? '',
      //                                   style: TextStyle(
      //                                       color: Colors.black.withOpacity(
      //                                           0.4)),),
      //                               )
      //                           ),
      //                           Container(
      //                               padding: const EdgeInsets.only(
      //                                   left: 6, right: 6, top: 2, bottom: 2),
      //                               decoration: BoxDecoration(
      //                                   color: Colors.blueGrey.withOpacity(0.4),
      //                                   borderRadius: BorderRadius.circular(8)
      //                               ),
      //                               child: Center(
      //                                 child: Text(
      //                                   controller.flightList[index]
      //                                       .destinationAirport ?? '',
      //                                   style: TextStyle(
      //                                       color: Colors.black.withOpacity(
      //                                           0.4)),),
      //                               )
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //
      //                     const SizedBox(height: 50,),
      //
      //                     Row(
      //                       children: List.generate(150 ~/ 6, (index) =>
      //                           Expanded(
      //                             child: Container(
      //                               color: index % 2 == 0 ? Colors.transparent
      //                                   : Colors.grey,
      //                               height: 2,
      //                             ),
      //                           )),
      //                     ),
      //
      //                     const SizedBox(height: 15,),
      //
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                       children: [
      //
      //                         Container(
      //                           // width: 80,
      //                             height: 30,
      //                             decoration: BoxDecoration(
      //                                 color: Colors.grey.withOpacity(0.35),
      //                                 borderRadius: BorderRadius.circular(20)
      //                             ),
      //                             child: Center(child: Padding(
      //                               padding: const EdgeInsets.all(8.0),
      //                               child: Row(
      //                                 children: [
      //                                   Icon(Icons.calendar_month_outlined,
      //                                     size: 15,
      //                                     color: Colors.grey.withOpacity(
      //                                         0.99),),
      //                                   Text(
      //                                     ' ${DateFormat('MMM-d-y').format(
      //                                         DateTime.parse(
      //                                             controller.flightList[index]
      //                                                 .departureAt ?? ''))}',
      //                                     style: TextStyle(
      //                                         color: Colors.grey.withOpacity(
      //                                             0.99)),
      //                                     // DateFormat('yMMMMd h:mm a').DateTime.parse(flight['departure_at']))
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),)
      //                         ),
      //
      //                         Container(
      //                           // width: 80,
      //                           height: 30,
      //                           decoration: BoxDecoration(
      //                               color: Colors.grey.withOpacity(0.35),
      //                               borderRadius: BorderRadius.circular(20)
      //                           ),
      //                           child: Center(
      //                             child: Padding(
      //                               padding: const EdgeInsets.only(
      //                                   left: 5, right: 5),
      //                               child: Row(
      //                                 mainAxisAlignment: MainAxisAlignment
      //                                     .spaceBetween,
      //                                 children: [
      //                                   Icon(Icons.access_time, size: 15,
      //                                     color: Colors.grey.withOpacity(
      //                                         0.99),),
      //                                   Text(
      //                                     ' ${controller.flightList[index]
      //                                         .durationTo! ~/ 60}h ${controller
      //                                         .flightList[index].durationTo! %
      //                                         60} min',
      //                                     style: TextStyle(
      //                                         color: Colors.grey.withOpacity(
      //                                             0.99)),
      //                                     // '${DateFormat('h:mm').format(DateTime.parse(flight['departure_at']))} min',)
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ),
      //                         )
      //
      //                       ],
      //                     ),
      //
      //                     const SizedBox(height: 10),
      //
      //                   ],
      //                 ),
      //               ),
      //             );
      //
      //             //   ListTile(
      //             //   title: Text(flight['airline']), // Adjust based on actual data structure
      //             //   subtitle: Text('Price: ${flight['price']}'), // Adjust based on actual data structure
      //             // );
      //           },
      //         ),
      //       ],
      //     ),
      //   );
      // }
      // )
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gofly/ui/views/search_flight_view/search_flight_controller.dart';
//
// class FlightInfoPage extends StatefulWidget {
//   const FlightInfoPage({Key? key}) : super(key: key);
//
//   @override
//   State<FlightInfoPage> createState() => _FlightInfoPageState();
// }
//
// class _FlightInfoPageState extends State<FlightInfoPage> {
//
//   SearchFlightController controller = Get.put(SearchFlightController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//
//       body: Obx((){
//
//         return controller.isProjectsLoading ? const CircularProgressIndicator() :
//             ListView.builder(
//                 itemCount: controller.flightList.length,
//                 shrinkWrap: true,
//                 itemBuilder: (context , index){
//                  return Text(controller.flightList[index].origin ?? '');
//                 }
//             );
//
//       }),
//     );
//   }
// }
