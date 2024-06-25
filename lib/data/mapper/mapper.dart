//to convert the response into a non nullable object(model)



  import 'package:clean_architecture_with_mvvm/data/responses/responses.dart';
import 'package:clean_architecture_with_mvvm/domain/model.dart';

const EMPTY = "";
  const ZERO=0;
extension CustomerResponseMapper on CustomerResponse? {

  Customer toDomain() {
    return Customer(
       this?.id?.orZero()??EMPTY,
         this?.name?.orEmpty()??EMPTY,
         this?.numOfNotifications?.orZero()??ZERO);
  }
}