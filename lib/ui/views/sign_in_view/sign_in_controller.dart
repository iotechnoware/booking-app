import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofly/core/data/repositories/user_repository.dart';
import 'package:gofly/core/enums/message_type.dart';
import 'package:gofly/core/services/base_controller.dart';
import 'package:gofly/ui/shared/custom_widgets/custom_toast.dart';
import 'package:gofly/ui/shared/utils.dart';
import 'package:gofly/ui/views/main_view/main_view.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  Future<UserCredential> signInWithGoogle() async {
    GoogleSignIn().disconnect();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signIn({String? email , String? token , String? uniqueId , String? password}) {
    runFullLoadingFutureFunction(
        function: UserRepository().login(
          password: password ?? passwordController.text,
          email: email ?? emailController.text,
          deviceName: 'Y9 2019'
        ).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(message: 'Login successfully' , messageType: MessageType.SUCCESS);
            storage.setLogIn(true);
            storage.setTokenInfo(r);
            Get.off( ()=> const MainView());
          });
        }));
  }
}