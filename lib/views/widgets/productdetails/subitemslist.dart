import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/productdetails_controller.dart';
import 'package:graduation_project/core/constant/color.dart';

class SubitemsList extends GetView<ProductDetailsControllerImp> {
  const SubitemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == "1"
                    ? AppColor.fourth
                    : Colors.white,
                border: Border.all(color: AppColor.fourth),
                borderRadius: BorderRadius.circular(10)),
            child: Text(controller.subitems[index]['name'],
                style: TextStyle(
                    color: controller.subitems[index]['active'] == "1"
                        ? Colors.white
                        : AppColor.fourth,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
