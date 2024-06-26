import 'package:get/get.dart';
import 'package:graduation_project/core/classes/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
  }
}