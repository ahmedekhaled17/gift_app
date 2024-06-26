import 'package:graduation_project/core/classes/crud.dart';
import '../../../link_api.dart';

class OfferData {
  Crud crud;
  OfferData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
