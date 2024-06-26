import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/sign_up_controller.dart';
import 'package:graduation_project/core/classes/handling_data_view.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/core/functions/valied_input.dart';
import 'package:graduation_project/views/widgets/auth/custom_buttom_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_field_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_title_auth.dart';
import 'package:graduation_project/views/widgets/auth/text_sign.dart';

import '../../widgets/auth/custom_text_body_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
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
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest
           (statusRequest: controller.statusRequest , widget:
          Container(
           padding: const EdgeInsets.symmetric(
              vertical: 15, horizontal: 30),
            child: Form(
             key: controller.formState,
             child: ListView(children: [
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: "10".tr),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: "24".tr),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 3, 20, "username");
                  },
                  myController: controller.username,
                  hintText: "23".tr,
                  iconData: Icons.person_outline,
                  labelText: "20".tr,
                ),
                CustomTextFormAuth(
                  isNumber: false,

                  valid: (val) {
                    return validInput(val!, 3, 40, "email");
                  },
                  myController: controller.email,
                  hintText: "12".tr,
                  iconData: Icons.email_outlined,
                  labelText: "18".tr,

                ),
                CustomTextFormAuth(
                  isNumber: true,
                  valid: (val) {
                    return validInput(val!, 7, 11, "phone");
                  },
                  myController: controller.phone,
                  hintText: "22".tr,
                  iconData: Icons.phone_android_outlined,
                  labelText: "21".tr,

                ),
                CustomTextFormAuth(
                  isNumber: false,

                  valid: (val) {
                    return validInput(val!, 3, 30, "password");
                  },
                  myController: controller.password,
                  hintText: "13".tr,
                  iconData: Icons.lock_outline,
                  labelText: "19".tr,
                  // mycontroller: ,
                ),
                CustomButtomAuth(
                    text: "17".tr,
                    onPressed: () {
                      controller.signUp();
                    }),
                const SizedBox(height: 40),
                CustomTextSignUpOrSignIn(
                  textOne: "25".tr,
                  textTwo: "26".tr,
                  onTap: () {
                    controller.goToSignIn();
                },
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}