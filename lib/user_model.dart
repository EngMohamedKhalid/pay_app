import 'dart:convert';

import '../../../../app/error/exceptions.dart';

class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.countryCode, 
      this.phone, 
      this.fullPhone, 
      this.lang, 
      this.isNotify, 
      this.token,
  });

  factory UserModel.fromJson(String source) {
    try {
      return UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      throw DataParsingException(e.toString());
    }
  }
  UserModel.fromMap(dynamic json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    fullPhone = json['full_phone'];
    lang = json['lang'];
    isNotify = json['is_notify'];
    token = json['token'];
    image = json['image'];
    email = json['email'];
  }
  num? id;
  String? name;
  String? countryCode;
  String? phone;
  String? fullPhone;
  String? lang;
  bool? isNotify;
  String? token;
  String? image;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['country_code'] = countryCode;
    map['phone'] = phone;
    map['full_phone'] = fullPhone;
    map['lang'] = lang;
    map['is_notify'] = isNotify;
    map['token'] = token;
    map['image'] = image;
    map['email'] = email;
    return map;
  }

}