import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/homescreen_controller.dart';
import 'package:graduation_project/core/constant/color.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/views/widgets/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primary,
            shape:const CircleBorder(eccentricity: 1),
              splashColor:  AppColor.second,
              onPressed: () {
                Get.toNamed(AppRoute.cart) ;
              },
              child: const Icon(Icons.shopping_basket_outlined,color: Colors.black,)),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body:WillPopScope(child:  controller.listPage.elementAt(controller.currentpage), onWillPop: (){

            Get.defaultDialog(title: "Warning",titleStyle:TextStyle(fontWeight: FontWeight.bold,color: AppColor.primary)
               ,middleText:"Do You Want To Exit The app",onCancel:(){
                },cancelTextColor:AppColor.second,confirmTextColor:AppColor.second,buttonColor:AppColor.third,onConfirm:(){
                  exit(0);
                });

            return Future.value(false);
          }),
        ));
  }}
