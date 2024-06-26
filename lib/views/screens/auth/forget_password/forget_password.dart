import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/forget_password/forget_password_controller.dart';
import 'package:graduation_project/core/classes/handling_data_view.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/views/widgets/auth/custom_buttom_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_body_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_field_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_title_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
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
        title: Text('14'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest
             (statusRequest: controller.statusRequest , widget: Container(
               padding:
               const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                    key: controller.formState,
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "27".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(
                      // please Enter Your Email Address To Recive A verification code
                        text: "29".tr),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {

                      },
                      myController: controller.email,
                      hintText: "12".tr,
                      iconData: Icons.email_outlined,
                      labelText: "18".tr,
                      // mycontroller: ,
                    ),
                    CustomButtomAuth(
                        text: "30".tr,
                        onPressed: () {
                          controller.checkemail();
                        }),
                    const SizedBox(height: 40),
              ]),
            ),
          )),
    ));
  }
}