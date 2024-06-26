import 'package:graduation_project/core/classes/crud.dart';
import 'package:graduation_project/link_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email" : email
    });
    return response.fold((l) => l, (r) => r);
  }
}