import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controller/homescreen_controller.dart';
import 'package:graduation_project/views/widgets/home/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        padding: EdgeInsets.only(right: 20),
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width, // or specify a fixed width
            child: Row(
            children: [
              ...List.generate(controller.listPage.length + 1, ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                  iconData:controller.bottomappbar[i]['icon'] ,
                  textButton:controller.bottomappbar[i]['title'],
                  onPressed: () {
                    controller.changePage(i);
                  },
                  active: controller.currentpage == i ? true : false,
                );
              })),
            ],
          ),
        ),
      ),
      ) );
  }
}
