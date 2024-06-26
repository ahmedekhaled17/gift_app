import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/forget_password/reset_password_controller.dart';
import 'package:graduation_project/core/classes/handling_data_view.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/core/functions/valied_input.dart';
import 'package:graduation_project/views/widgets/auth/custom_buttom_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_body_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_field_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_title_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
        centerTitle: true,
        elevation: 0.0,
        title: Text('ResetPassword',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest
            (statusRequest: controller.statusRequest , widget: Container(
                padding:
                 const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formState,
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "35".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "35".tr),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 40, "password");
                      },
                      myController: controller.password,
                      hintText: "13".tr,
                      iconData: Icons.lock_outline,
                      labelText: "19".tr,
                      // mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,

                      valid: (val) {
                        return validInput(val!, 3, 40, "password");
                      },
                      myController: controller.repassword,
                      hintText: "Re" + " " + "13".tr,
                      iconData: Icons.lock_outline,
                      labelText: "19".tr,
                      // mycontroller: ,
                    ),
                    CustomButtomAuth(
                        text: "33".tr,
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        }),
                    const SizedBox(height: 40),
              ]),
            ),
          )),
    ));
  }
}