import 'package:graduation_project/core/classes/crud.dart';
import 'package:graduation_project/link_api.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username ,
      "password" : password  ,
      "email" : email ,
      "phone" : phone  ,
    });
    return response.fold((l) => l, (r) => r);
  }
}