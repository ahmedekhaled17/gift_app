import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/login_controller.dart';
import 'package:graduation_project/core/classes/handling_data_view.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/core/functions/valied_input.dart';
import 'package:graduation_project/views/widgets/auth/custom_buttom_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_body_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_field_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_title_auth.dart';
import 'package:graduation_project/views/widgets/auth/logo_auth.dart';
import 'package:graduation_project/views/widgets/auth/text_sign.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
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
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => HandlingDataRequest
          (statusRequest: controller.statusRequest , widget:
           Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(children: [
                const LogoAuth(),
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: "10".tr),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: "11".tr),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  isNumber: false,

                  valid: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                  myController: controller.email,
                  hintText: "12".tr,
                  iconData: Icons.email_outlined,
                  labelText: "18".tr,
                ),
                GetBuilder<LoginControllerImp>(
                  builder: (controller) => CustomTextFormAuth(
                    obscureText: controller.isshowpassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 30, "password");
                    },
                    myController: controller.password,
                    hintText: "13".tr,
                    iconData: Icons.lock_outline,
                    labelText: "19".tr,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "14".tr,
                    textAlign: TextAlign.right,
                  ),
                ),
                CustomButtomAuth(
                    text: "15".tr,
                    onPressed: () {
                      controller.login();
                    }),
                const SizedBox(height: 40),
                CustomTextSignUpOrSignIn(
                  textOne: "16".tr,
                  textTwo: "17".tr,
                  onTap: () {
                    controller.goToSignUp();
                  },
                )
              ]),
            ),
          ),
     )
    ));
  }
}