import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:gofly/core/data/models/apis/flight_model.dart';
import 'package:gofly/core/data/repositories/flight_repository.dart';
import 'package:gofly/core/enums/Operation_type.dart';
import 'package:gofly/core/enums/message_type.dart';
import 'package:gofly/core/enums/request_status.dart';
import 'package:gofly/core/services/base_controller.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_toast.dart';




class SearchFlightController extends BaseController {

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  RxList<FlightModel> flightList = <FlightModel>[].obs;
  RxList<dynamic> resultList = <dynamic>[].obs;
  RxList<dynamic> pricingResultList  = <dynamic>[].obs;

  RxString creationDate = ''.obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString id = ''.obs;

  RxBool oneWay = true.obs;


  bool get isPricingLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.PRICING);

  bool get isResultLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.CATEGORIES);

  bool get isCreateOrderLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.ORDER);




  void getFlights(
      {required String destination, required String origin, String? departureAt, String? returnAt , int? adult , bool? nonStop}) {
    runLoadingFutureFunction(
        type: OperationType.CATEGORIES,
        function: FlightRepository().fetchFlightOffers(
            origin: origin,
            destination: destination,
            departureAt: departureAt,
            returnAt: returnAt,
            adult: adult.toString(),
            max: '15',
            nonStop: nonStop
        ).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            resultList.clear();
            resultList.addAll(r);
          });
        }));
  }




  void getPricing(Map<String,dynamic> flightOffers) {
    runLoadingFutureFunction(
      type: OperationType.PRICING,
        function: FlightRepository().getPricing(flightOffers).then((value) {
          value.fold((error) {
                CustomToast.showMessage(message: error, messageType: MessageType.REJECTED);
              }, (pricingData) {
                if (pricingData != null && pricingData is Map<String, dynamic>) {
                  pricingResultList.clear();
                  pricingResultList.add(pricingData);
                } else {
                  CustomToast.showMessage(
                      message: "Received pricing data is not in the expected format",
                      messageType: MessageType.WARNING
                  );
                }
              }
          );
        })
    );
  }

  void createOrder(Map<String,dynamic> priceOffer) {
    runFullLoadingFutureFunction(
        // type: OperationType.ORDER,
        function: FlightRepository().createOrder(priceOffer).then((value) {
          value.fold((error) {
            CustomToast.showMessage(message: error, messageType: MessageType.REJECTED);
          }, (orderData) {
            if (orderData != null && orderData is Map<String, dynamic>) {
              pricingResultList.clear();
              pricingResultList.add(orderData);
              id.value = orderData['data']['flightOffers'][0]['id'] ?? '';
              creationDate.value = orderData['data']['associatedRecords'][0]['creationDate'] ?? '';
              firstName.value = orderData['data']['travelers'][0]['name']['firstName'] ?? '';
              lastName.value = orderData['data']['travelers'][0]['name']['lastName'] ?? '';
              email.value = orderData['data']['travelers'][0]['contact']['emailAddress'] ?? '';
              CustomToast.showMessage(message: 'Done', messageType: MessageType.SUCCESS);
            } else {
              CustomToast.showMessage(
                  message: "Received pricing data is not in the expected format",
                  messageType: MessageType.WARNING
              );
            }
          }
          );
        })
    );
  }


}