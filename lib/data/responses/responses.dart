//json annotation used for json serialization to handle json data responses
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';
@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  int?baseResponseStatus;
  @JsonKey(name: "message")
  String?message;

  BaseResponse (  this.baseResponseStatus,  this.message,);
  //from json
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);


//to json
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

}


//we use JsonSerializable to make our model serializable
@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: "id")
  String?id;
  @JsonKey(name: "name")
  String?name;
  @JsonKey(name: "numOfNotifications")
  int?numOfNotifications;


  CustomerResponse (  this.id,  this.name,  this.numOfNotifications,);
  //from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);


//to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}



@JsonSerializable()
class ContactsResponse{
  @JsonKey(name: "phone")
  String?phone;
  @JsonKey(name: "link")
  String?link;
  @JsonKey(name: "email")
  String?email;

  ContactsResponse (  this.phone,  this.link,  this.email,);
  //from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) => _$ContactsResponseFromJson(json);


//to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);

}


@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "customer")
  CustomerResponse?customer;
  @JsonKey(name: "contacts")
  ContactsResponse?contacts;


  AuthenticationResponse(this.customer, this.contacts) : super(0, '');

  //from json
factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => _$AuthenticationResponseFromJson(json);


//to json
Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);


}