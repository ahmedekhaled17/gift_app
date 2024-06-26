import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/classes/status_request.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/datasource/remote/offers_data.dart';
import '../data/models/items_model.dart';
import 'home_controller.dart';

class OffersController extends SearchMixController {
  OfferData offerData = OfferData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await offerData.getData();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdataz = response['data'];
        data.addAll(listdataz.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
