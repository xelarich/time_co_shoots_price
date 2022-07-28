import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable()
class Client {
  String? name;
  String? firstname;
  String? mail;
  String? phoneNumber;

  Client({this.name, this.firstname, this.mail, this.phoneNumber});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

/*@JsonSerializable()
class Child extends Client {
  String birthday;

  Child(int id, String name, String firstname, this.birthday)
      : super(id, name, firstname);

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  Map<String, dynamic> toJson() => _$ChildToJson(this);
}*/
