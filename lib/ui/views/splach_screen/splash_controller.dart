import 'package:get/get.dart';
import 'package:gofly/core/data/models/apis/refresh_token_model.dart';
import 'package:gofly/core/data/models/apis/token_info.dart';
import 'package:gofly/core/data/repositories/user_repository.dart';
import 'package:gofly/core/enums/message_type.dart';
import 'package:gofly/core/services/base_controller.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_toast.dart';
import 'package:gofly/ui/shared/utils.dart';

class SplashController extends BaseController{

  Rx<RefreshTokenModel> accessToken = RefreshTokenModel().obs;

  RxString token= ''.obs;

  @override
  void onInit() {
    refreshToken();
    super.onInit();
  }

  void refreshToken(){
    runFutureFunction(
      function: UserRepository().refreshToken().then((value) {
        value.fold((l) {
          CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
        }, (r) {
          accessToken.value = r;
          // CustomToast.showMessage(message: r.accessToken.toString(), messageType: MessageType.SUCCESS);
          storage.setRefreshToken(r);
        });
      })
    );
  }

}