import 'package:get/get.dart';
import 'package:graduation_project/core/classes/status_request.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/functions/handling_data_controller.dart';
import 'package:graduation_project/data/datasource/remote/forget_password/verify_code.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
  VerifyCodeForgetPasswordData(Get.find());

  StatusRequest statusRequest =StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await verifyCodeForgetPasswordData.postdata(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword , arguments: {
          "email" : email
        });
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}