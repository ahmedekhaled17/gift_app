import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:graduation_project/views/widgets/offers/customitemsoffers.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/offers_controller.dart';
import '../../core/classes/handling_data_view.dart';
import '../../core/constant/routes.dart';
import '../widgets/customappbar.dart';
import 'home.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(horizontal: 10,),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Product",
                    // onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myfavroite);
                    },
                  ),
                  SizedBox(height: 20,),
                   !controller.isSearch ?
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) => CustomListItemsOffer(
                              itemsModel: controller.data[index]))) :  ListItemsSearch(listdatamodel: controller.listdata)
                ],
              ),
            ));
  }
}
