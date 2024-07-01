import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';
//we use freezed to make our model serializable an if user change credintials it will be reflected in our model
@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName,String password)=_LoginObject;

}