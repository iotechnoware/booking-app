import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofly/core/data/repositories/user_repository.dart';
import 'package:gofly/core/enums/message_type.dart';
import 'package:gofly/core/services/base_controller.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_toast.dart';
import 'package:gofly/ui/shared/utils.dart';
import 'package:gofly/ui/views/main_view/main_view.dart';


class SignUpController extends BaseController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  RxBool hidePassword1 = true.obs;
  RxBool hidePassword2 = true.obs;

  void signup() {
    runFullLoadingFutureFunction(
        function: UserRepository().register(
          firstname: firstnameController.text,
          lastname: lastnameController.text,
          password: passwordController.text,
          email: emailController.text,
          term: 'accept',
        )
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            UserRepository().login(
              password: passwordController.text,
              email: emailController.text,
              deviceName: 'Y9 2019',)
                .then((value) {
              value.fold((l) {
                CustomToast.showMessage(
                    message: l, messageType: MessageType.REJECTED);
              }, (r) {
                CustomToast.showMessage(
                    message: 'Registered SUCCESS', messageType: MessageType.SUCCESS);
                storage.setLogIn(true);
                storage.setTokenInfo(r);
                Get.off( ()=> const MainView());
              });
            });
          });
        })
    );
  }
}