import 'package:graduation_project/core/classes/crud.dart';
import 'package:graduation_project/link_api.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}