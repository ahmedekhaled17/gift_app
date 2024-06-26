import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/color.dart';
Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Alert",
      titleStyle:  TextStyle(color: AppColor.primary , fontWeight: FontWeight.bold),
      middleText: "Do you want to exit the application?",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primary)),
            onPressed: () {
              exit(0);
            },
            child:const Text("Confirm",style: TextStyle(color: Colors.black),)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primary)),
            onPressed: () {
              Get.back();
            },
            child:const Text("cancel",style: TextStyle(color: Colors.black),))
      ]);
  return Future.value(true);
}