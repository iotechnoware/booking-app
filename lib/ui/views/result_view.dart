// // ignore_for_file: camel_case_types, sort_child_properties_last, non_constant_identifier_names
// import 'package:gofly/ui/views/search_flight_view/suggestions_controller.dart';
// import 'package:get/get.dart';
// import 'package:gofly/core/enums/message_type.dart';
// import 'package:gofly/selectflightfilterandshort.dart';
// import 'package:gofly/theme/theme_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:gofly/ui/shared/custom_widgets/custom_button.dart';
// import 'package:gofly/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:gofly/ui/shared/utils.dart';
// import 'package:gofly/ui/views/main_view/home_page_view/home_page_view.dart';
// import 'package:gofly/ui/views/search_flight_view/flight_info_page.dart';
// import 'package:gofly/ui/views/search_flight_view/search_flight_controller.dart';
// import 'package:gofly/ui/views/test.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class ResultView extends StatefulWidget {
//   const ResultView({Key? key}) : super(key: key);
//
//   @override
//   State<ResultView> createState() => _ResultViewState();
// }
//
// class _ResultViewState extends State<ResultView>
//     with SingleTickerProviderStateMixin {
//
//   // bool show = false;
//
//
//   late ColorNotifire notifire;
//   getdarkmodepreviousstate() async {
//     final prefs = await SharedPreferences.getInstance();
//     bool? previusstate = prefs.getBool("setIsDark");
//     if (previusstate == null) {
//       notifire.setIsDark = false;
//     } else {
//       notifire.setIsDark = previusstate;
//     }
//   }
//
//   // Future<List<AirportModel>> fetchAirports(String query) async {
//   //   final response = await http.get(
//   //     Uri.parse('https://api.api-ninjas.com/v1/airports?name=$query'),
//   //     headers: {
//   //       'X-Api-Key': 'uzsNkQttcSdGsKHdWeVZJw==sTprz1oc78FV8wlZ', // Replace with your actual API key
//   //     },
//   //   );
//   //
//   //   if (response.statusCode == 200) {
//   //     List<dynamic> data = json.decode(response.body);
//   //     return data.map((json) => AirportModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load airports');
//   //   }
//   // }
//
//   // ignore: non_constant_identifier_names
//   SearchFlightController searchController = Get.put(SearchFlightController());
//   SuggestionsController suggestionController = Get.put(SuggestionsController());
//
//
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //
//   //   searchController.toController.addListener(() {
//   //     suggestionController.hideSuggestions2.value = false;
//   //     final inputText = searchController.toController.text;
//   //     if (inputText.isNotEmpty) {
//   //       // Call the API with debounce logic if necessary
//   //       suggestionController.suggestionsDataTo.clear();
//   //       suggestionController.getSuggestionTo(iata: inputText);
//   //     } else {
//   //       suggestionController.suggestionsDataTo.clear(); // Clear suggestions if input is empty
//   //     }
//   //   });
//   //
//   //
//   //   searchController.fromController.addListener(() {
//   //     suggestionController.hideSuggestions.value = false;
//   //     final inputText = searchController.fromController.text;
//   //     if (inputText.isNotEmpty) {
//   //       // Call the API with debounce logic if necessary
//   //       suggestionController.suggestionsDataFrom.clear();
//   //       suggestionController.getSuggestionFrom(iata: inputText);
//   //     } else {
//   //       suggestionController.suggestionsDataFrom.clear(); // Clear suggestions if input is empty
//   //     }
//   //   });
//   // }
//
//   DateTime? departureDate;
//   DateTime? returnDate;
//
//   Future<void> _selectDepartureDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: departureDate ?? DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != departureDate) {
//       setState(() {
//         departureDate = picked; // Update the selected date
//       });
//     }
//   }
//
//   Future<void> _selectReturnDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: returnDate ?? DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != returnDate) {
//       setState(() {
//         returnDate = picked; // Update the selected date
//       });
//     }
//   }
//
//   // @override
//   // void dispose() {
//   //   searchController.toController.dispose();
//   //   super.dispose();
//   // }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     notifire = Provider.of<ColorNotifire>(context, listen: true);
//     return GestureDetector(
//       onTap: (){
//         suggestionController.suggestionsDataFrom.clear();
//         suggestionController.suggestionsDataTo.clear();
//         suggestionController.hideSuggestions.value = true;
//         suggestionController.hideSuggestions2.value = true;
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor:notifire.backgroundallscreenColor,
//         appBar: AppBar(
//           backgroundColor: notifire.backgroundallscreenColor,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           centerTitle: true,
//           title: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 4,top: 8),
//                   child: Container(
//                     height: 48,
//                     width: 48,
//                     decoration: BoxDecoration(
//                         border: Border.all(color:notifire.backbuttonborderColor),
//                         borderRadius: BorderRadius.circular(16)),
//                     child: Center(
//                       child: IconButton(
//                         icon:  Icon(
//                           Icons.arrow_back_ios_new_outlined,
//                           color:notifire.backbuttoniconColor,
//                         ),
//                         iconSize: 14,
//                         color: Colors.black,
//                         onPressed: () {
//                           Navigator.of(context).pop(
//                             MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                               const HomePageView(),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 Row(
//                   children:  [
//                     Text(
//                       "Search flight",
//                       style: TextStyle(
//                           color: notifire.getdarkscolor,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 18,fontFamily: 'Gilroy'
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 40,
//                   width: 40,
//                   alignment: Alignment.center,
//                   child: IconButton(
//                     icon: Image.asset('assets/old_images/settingsselect.png'),
//                     iconSize: 20,
//                     color: Colors.black,
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (BuildContext context) =>
//                           const filterandshortmain(),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//
//               SizedBox(height: screenWidth(20)),
//
//               // CustomTextField(
//               //     // hitText: 'From where ',
//               //     controller: controller.fromController,
//               //     iconImage: 'Searchexplore',
//               // ),
//               //
//               // SizedBox(height: screenWidth(25)),
//               //
//               // CustomTextField(
//               //     // hitText: 'To where',
//               //     controller: controller.toController,
//               //     iconImage: 'Searchexplore',
//               // ),
//
//               // TextField(
//               //   onChanged: (text) {
//               //     if (text.isNotEmpty) {
//               //       suggestionController.suggestionsData.clear();
//               //       suggestionController.getSuggestion(iata: text);
//               //     } else {
//               //       suggestionController.suggestionsData.clear();
//               //     }
//               //   },
//               //   controller: searchController.fromController,
//               //   style: const TextStyle(color: Colors.black,fontFamily: "gilroy"),
//               //   keyboardType: TextInputType.emailAddress,
//               //   textInputAction: TextInputAction.next,
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(
//               //         borderRadius: BorderRadius.circular(12)
//               //     ),
//               //     enabledBorder: OutlineInputBorder(
//               //       borderRadius: BorderRadius.circular(12),
//               //       borderSide: const BorderSide(
//               //         color: Colors.grey,
//               //       ),
//               //     ),
//               //     hintStyle: const TextStyle(color: Colors.black,fontFamily: "gilroy"),
//               //     fillColor: Colors.white,
//               //     // hintText: widget.hitText,
//               //     // labelText: widget.labelText,
//               //     labelStyle:const TextStyle(color: Colors.black,fontFamily: "gilroy"),
//               //     prefixIcon:
//               //     Image.asset("assets/old_images/Searchexplore.png", scale: 24,color: Colors.black,),
//               //   ),
//               // ),
//
//
//               SizedBox(height: screenWidth(25)),
//
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Expanded(
//                     child: Column(
//                       children: [
//                         TextField(
//                           onChanged: (text) {
//                             if (text.isNotEmpty) {
//                               suggestionController.hideSuggestions.value = true;
//                               suggestionController.suggestionsDataFrom.clear();
//                               suggestionController.getSuggestionFrom(iata: text);
//                             } else {
//                               suggestionController.suggestionsDataFrom.clear();
//                               suggestionController.hideSuggestions.value = true;
//                             }
//                           },
//                           controller: searchController.fromController,
//                           style: const TextStyle(color: Colors.black,fontFamily: "gilroy"),
//                           keyboardType: TextInputType.emailAddress,
//                           textInputAction: TextInputAction.next,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12)
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             hintStyle: TextStyle(color: Colors.black.withOpacity(0.5),fontFamily: "gilroy"),
//                             fillColor: Colors.white,
//                             hintText: 'From where',
//                             // labelText: widget.labelText,
//                             labelStyle:const TextStyle(color: Colors.black,fontFamily: "gilroy"),
//                             prefixIcon:
//                             Image.asset("assets/old_images/Searchexplore.png", scale: 24,color: Colors.black,),
//                           ),
//                         ),
//                         suggestionController.hideSuggestions.value ? const SizedBox.shrink() : Obx(() {
//                           return suggestionController.isSuggestionsLoadingFrom ?
//                           const CircularProgressIndicator() : SizedBox(
//                             height: 150,
//                             child: ListView.builder(
//                               padding: const EdgeInsets.only(top: 5),
//                               shrinkWrap: true,
//                               physics: const ScrollPhysics(),
//                               itemCount: suggestionController.suggestionsDataFrom.length,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey.withOpacity(0.25),
//                                       borderRadius: BorderRadius.circular(10)
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//
//                                       Text(
//                                         suggestionController.iataFrom.value = suggestionController.suggestionsDataFrom[index].iata!,
//                                         style: const TextStyle(fontSize: 0),
//                                       ),
//
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: InkWell(
//                                           onTap: (){
//                                             searchController.fromController.text = suggestionController.suggestionsDataFrom[index].city!;
//                                             suggestionController.suggestionsDataFrom.clear();
//                                             suggestionController.hideSuggestions.value = true;
//                                             // FocusScope.of(context).unfocus();
//                                           },
//                                           child: Text(
//                                             '${suggestionController.suggestionsDataFrom[index].city!}    (${suggestionController.suggestionsDataFrom[index].iata!})',
//                                             style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ); // Adjust according to your AirportModel properties
//                               },
//                             ),
//                           );
//                         }),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(width: 10,),
//
//                   Expanded(
//                     child: Column(
//                       children: [
//                         TextField(
//                           onChanged: (text) {
//                             if (text.isNotEmpty) {
//                               suggestionController.suggestionsDataTo.clear();
//                               suggestionController.getSuggestionTo(iata: text);
//                               suggestionController.hideSuggestions2.value = true;
//                             } else {
//                               suggestionController.suggestionsDataTo.clear();
//                               suggestionController.hideSuggestions2.value = true;
//                             }
//                           },
//                           controller: searchController.toController,
//                           style: const TextStyle(color: Colors.black,fontFamily: "gilroy"),
//                           keyboardType: TextInputType.emailAddress,
//                           textInputAction: TextInputAction.next,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12)
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             hintStyle: TextStyle(color: Colors.black.withOpacity(0.5),fontFamily: "gilroy"),
//                             fillColor: Colors.white,
//                             hintText: 'To where',
//                             // labelText: widget.labelText,
//                             labelStyle:const TextStyle(color: Colors.black,fontFamily: "gilroy"),
//                             prefixIcon:
//                             Image.asset("assets/old_images/Searchexplore.png", scale: 24,color: Colors.black,),
//                           ),
//                         ),
//                         suggestionController.hideSuggestions2.value ? const SizedBox.shrink() : Obx(() {
//                           return suggestionController.isSuggestionsLoadingTo ?
//                           const CircularProgressIndicator() : SizedBox(
//                             height: 150,
//                             child: ListView.builder(
//                               padding: const EdgeInsets.only(top: 5),
//                               shrinkWrap: true,
//                               physics: const ScrollPhysics(),
//                               itemCount: suggestionController.suggestionsDataTo.length,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey.withOpacity(0.25),
//                                       borderRadius: BorderRadius.circular(10)
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//
//                                       Text(
//                                         suggestionController.iataTo.value = suggestionController.suggestionsDataTo[index].iata!,
//                                         style: const TextStyle(fontSize: 0),
//                                       ),
//
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: InkWell(
//                                           onTap: (){
//                                             searchController.toController.text = suggestionController.suggestionsDataTo[index].city!;
//                                             suggestionController.suggestionsDataTo.clear();
//                                             suggestionController.hideSuggestions2.value = true;
//                                             // FocusScope.of(context).unfocus();
//                                           },
//                                           child: Text(
//                                             '${suggestionController.suggestionsDataTo[index].city!}    (${suggestionController.suggestionsDataTo[index].iata!})',
//                                             style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ); // Adjust according to your AirportModel properties
//                               },
//                             ),
//                           );
//                         }),
//                       ],
//                     ),
//                   ),
//
//                 ],
//               ),
//
//
//
//
//
//               // IconButton(onPressed: (){
//               //   suggestionController.getSuggestion(iata: 'dubai');
//               // },
//               //     icon: Icon(Icons.clear)
//               // ),
//               //
//               // Obx(() {
//               //   return suggestionController.isSuggestionsLoading ? CircularProgressIndicator() :
//               //   Text(suggestionController.suggestionsList.value.city ?? '');
//               // }),
//
//
//
//               // const SizedBox(height: 20,),
//
//               Row(
//                 children: [
//
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () => _selectDepartureDate(context), // Show date picker when tapped
//                       child: Container(
//                         padding:
//                         const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                         decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey[200]),
//                         child:
//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
//                           Text(departureDate == null
//                               ? 'Departure Date'
//                               : '${departureDate!.day}-${departureDate!.month}-${departureDate!.year}'),
//                           const Icon(Icons.calendar_today)
//                         ]),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(width: 20,),
//
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () => _selectReturnDate(context), // Show date picker when tapped
//                       child: Container(
//                         padding:
//                         const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                         decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey[200]),
//                         child:
//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
//                           Text(returnDate == null
//                               ? 'Return Date'
//                               : '${returnDate!.day}-${returnDate!.month}-${returnDate!.year}'),
//                           const Icon(Icons.calendar_today)
//                         ]),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//
//               const SizedBox(height: 20,),
//
//               // Text(storage.getRefreshToken()!.accessToken.toString()),
//
//               // CustomButton(
//               //   text: 'Search wergwr',
//               //   onPressed: (){
//               //     // Get.to(Test());
//               //   },
//               // ),
//               CustomButton(
//                 text: 'Search wergwr',
//                 onPressed: (){
//                   if (searchController.fromController.value.text.length >= 3 && searchController.toController.value.text.length >= 3)
//                   {
//                     // searchController.flightList.clear();
//                     searchController.getFlights(
//                       origin: suggestionController.iataFrom.value,
//                       destination: suggestionController.iataTo.value,
//                       departureAt: departureDate.isNull ? '' : '${departureDate!.year}-${departureDate!.month}-${departureDate!.day}',
//                       returnAt: returnDate.isNull ? '' :'${returnDate!.year}-${returnDate!.month}-${returnDate!.day}',
//                     );
//                     Get.to( Test());
//                   }
//                   else {
//                     CustomToast.showMessage(message: 'Please enter at least 3 letters in each field' , messageType: MessageType.WARNING);
//                   }
//                 },
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
