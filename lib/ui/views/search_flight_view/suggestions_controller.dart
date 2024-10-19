import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:gofly/core/data/models/apis/airport_mode.dart';
import 'package:gofly/core/data/models/apis/airport_model.dart';
import 'package:gofly/core/data/repositories/suggestions_repository.dart';
import 'package:gofly/core/enums/Operation_type.dart';
import 'package:gofly/core/enums/message_type.dart';
import 'package:gofly/core/enums/request_status.dart';
import 'package:gofly/core/services/base_controller.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_toast.dart';

class SuggestionsController extends BaseController{


  // Rx<AirportModel> suggestionsData = AirportModel().obs;


  RxList<AirportModel> suggestionsDataFrom = <AirportModel>[].obs;
  RxList<AirportModel> suggestionsDataTo = <AirportModel>[].obs;

  bool get isSuggestionsLoadingFrom =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.CATEGORIES);

  bool get isSuggestionsLoadingTo =>
      requestStatus.value == RequestStatus.LOADING &&
          listType.contains(OperationType.PRODUCTS);

  RxString iataFrom = ''.obs;
  RxString iataTo = ''.obs;

  RxBool hideSuggestions = false.obs;
  RxBool hideSuggestions2 = false.obs;
  void resetSuggestions() {
    hideSuggestions.value = true;
    hideSuggestions2.value = true;
    suggestionsDataFrom.clear();
    suggestionsDataTo.clear();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   resetSuggestions();
  // }

   getSuggestionFrom({required String iata}){
    runLoadingFutureFunction(
        type: OperationType.CATEGORIES,
        function: SuggestionsRepository().getSuggestions(
          query: iata
        ).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            print('API Response: $r');
            suggestionsDataFrom.clear();
            suggestionsDataFrom.addAll(r);
          });
        }));
  }

  getSuggestionTo({required String iata}){
    runLoadingFutureFunction(
        type: OperationType.PRODUCTS,
        function: SuggestionsRepository().getSuggestions(
            query: iata
        ).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            suggestionsDataTo.clear();
            suggestionsDataTo.addAll(r);
          });
        }));
  }


}