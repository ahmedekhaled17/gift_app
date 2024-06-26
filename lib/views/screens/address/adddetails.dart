import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/address/adddetails_controller.dart';
import 'package:graduation_project/controller/shared/custombutton.dart';
import 'package:graduation_project/core/classes/handling_data_view.dart';
import '../../widgets/auth/custom_text_field_auth.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hintText: "city",
                      labelText: "city",
                      iconData: Icons.location_city,
                      myController: controller.city,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hintText: "street",
                      labelText: "street",
                      iconData: Icons.streetview,
                      myController: controller.street,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hintText: "name",
                      labelText: "name",
                      iconData: Icons.near_me,
                      myController: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  CustomButton(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress() ; 
                    },
                  )
                ])),
          )),
    );
  }
}
