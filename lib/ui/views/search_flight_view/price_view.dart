// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gofly/ui/views/search_flight_view/search_flight_controller.dart';
//
// class PriceView extends StatelessWidget {
//   const PriceView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final SearchFlightController controller = Get.find<SearchFlightController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flight Pricing'),
//       ),
//       body: Obx(() {
//
//
//         final pricingData = controller.pricingResultList.first;
//         final flightOffers = pricingData['data']['flightOffers'] as List<dynamic>;
//
//         return controller.isPricingLoading ? const Center(child: CircularProgressIndicator()) :
//             controller.pricingResultList.isEmpty ? const Text('No Pricing for this Search ') :
//         ListView.builder(
//           itemCount: flightOffers.length,
//           itemBuilder: (context, index) {
//             final offer = flightOffers[index];
//             final price = offer['price'];
//             final itineraries = offer['itineraries'] as List<dynamic>;
//
//             return Stack(
//               children: [
//                 Card(
//                   margin: const EdgeInsets.all(8),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Total Price: ${price['total']} ${price['currency']}',
//                           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'ID: ${offer['id']}',
//                           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 8),
//                         Text('Base Price: ${price['base']} ${price['currency']}'),
//                         const SizedBox(height: 16),
//                         const Text('Flight Details:', style: TextStyle(fontWeight: FontWeight.bold)),
//                         ...itineraries.map((itinerary) {
//                           final segments = itinerary['segments'] as List<dynamic>;
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: segments.map((segment) {
//                               return ListTile(
//                                 title: Text('${segment['departure']['iataCode']} to ${segment['arrival']['iataCode']}'),
//                                 subtitle: Text('Departure: ${segment['departure']['at']}\nArrival: ${segment['arrival']['at']}'),
//                               );
//                             }).toList(),
//                           );
//                         }).toList(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.only( top : 180, end : 15 ),
//                   child: Align(
//                     alignment: AlignmentDirectional.topEnd,
//                     child: InkWell(
//                       onTap: (){
//                         controller.createOrder(offer);
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 35,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(10)
//                         ),
//                         child: const Center(child: Text('Create Order' , style: TextStyle(color: Colors.white),)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gofly/ui/views/search_flight_view/search_flight_controller.dart';

class PriceView extends StatelessWidget {
  const PriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchFlightController controller = Get.find<SearchFlightController>();

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          controller.creationDate.value = '';
          controller.firstName.value = '';
          controller.lastName.value = '';
          controller.email.value = '';
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flight Pricing'),
          leading: InkWell(onTap: (){controller.creationDate.value = ''; Get.back();},child: Icon(Icons.arrow_back),),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.isPricingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.pricingResultList.isEmpty) {
            return const Center(child: Text('No Pricing for this Search'));
          }

          final pricingData = controller.pricingResultList.first;
          final flightOffers = pricingData['data']['flightOffers'] as List<dynamic>;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: flightOffers.length,
                itemBuilder: (context, index) {
                  final offer = flightOffers[index];
                  final price = offer['price'];
                  final itineraries = offer['itineraries'] as List<dynamic>;

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${price['total']} ${price['currency']}',
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                'ID: ${offer['id']}',
                                style: const TextStyle(fontSize: 14, color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...itineraries.map((itinerary) {
                                final segments = itinerary['segments'] as List<dynamic>;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: segments.map((segment) {
                                    final departureDate = DateTime.parse(segment['departure']['at']);
                                    final arrivalDate = DateTime.parse(segment['arrival']['at']);
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${segment['departure']['iataCode']} → ${segment['arrival']['iataCode']}',
                                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  DateFormat('MMM d, HH:mm').format(departureDate),
                                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Icon(Icons.flight, color: Colors.blue),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'Arrival',
                                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  DateFormat('MMM d, HH:mm').format(arrivalDate),
                                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                );
                              }).toList(),
                              const SizedBox(height: 16),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () => controller.createOrder(offer),
                                  child: const Text('Create Order'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              Obx(() {
                if (controller.creationDate.isNotEmpty) {
                  return Card(
                    margin: const EdgeInsets.all(16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Information',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow('Creation Date', controller.creationDate.value),
                          _buildInfoRow('ID', controller.id.value),
                          _buildInfoRow('First Name', controller.firstName.value),
                          _buildInfoRow('Last Name', controller.lastName.value),
                          _buildInfoRow('Email', controller.email.value),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),

            ],
          );
        }),
      ),
    );
  }
}
Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    ),
  );
}
