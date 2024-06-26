import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/views/widgets/orders/dialograting.dart';
import 'package:jiffy/jiffy.dart';
import '../../../controller/orders/archive_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/models/ordersmodel.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                 // Text(listdata.ordersDatetime!)
                  Text(
                      Jiffy.now().format(pattern: 'MMM do yy'),
                    style:  TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style:  TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.third,
                    textColor: AppColor.second,
                    child: const Text("Details"),
                  ),
                 const SizedBox(width: 10,),
                if(listdata.ordersRating =="0" )  MaterialButton(
                    onPressed: () {
                      showDialogRating(context,listdata.ordersId!);
                    },
                    color: AppColor.third,
                    textColor: AppColor.second,
                    child: const Text("Rating"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}