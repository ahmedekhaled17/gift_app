import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/auth/verifycodesignup_contoller.dart';
import 'package:graduation_project/core/classes/handling_data_view.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_body_auth.dart';
import 'package:graduation_project/views/widgets/auth/custom_text_title_auth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
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
        title: Text('Verification Code',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest
            (statusRequest: controller.statusRequest , widget: Container(
             padding:
             const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(children: [
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: "Check code"),
                const SizedBox(height: 10),
                 CustomTextBodyAuth(
                    text:
                    "Please Enter The Digit Code Sent To ${controller.email}"),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: AppColor.primary,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.goToSuccessSignUp(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(height: 40),
                InkWell(onTap: (){
                  controller.reSend() ;
                },child: Center(child: Text("Resend verfiy code" , style: TextStyle(color: AppColor.primary , fontSize: 20 ),)),)
              ]),
            )),
    ));
  }
}