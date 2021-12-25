import 'dart:convert';
import 'package:food_ninja_app/data/models/menu_item.dart';

class UserData {
  String userID;
  String username;
  String email;
  String password;
  String phone;
  bool isPhoneVerfied;
  bool isPremiumAcc;
  List<String>? vouchersList;
  List<MenuItemModel>? favoriteList;
  String? visaNumber;
  String? location;
  String? profilePhotoUrl;

  UserData({
    required this.userID,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    this.isPhoneVerfied = false,
    this.isPremiumAcc = false,
    this.vouchersList,
    this.favoriteList,
    this.visaNumber,
    this.location,
    this.profilePhotoUrl,
  });
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
      'isPhoneVerfied': isPhoneVerfied,
      'isPremiumAcc': isPremiumAcc,
      'vouchersList': vouchersList,
      'favoriteList': favoriteList?.map((x) => x.toMap()).toList(),
      'visaNumber': visaNumber,
      'location': location,
      'profilePhotoUrl': profilePhotoUrl,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userID: map['userID'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      isPhoneVerfied: map['isPhoneVerfied'],
      isPremiumAcc: map['isPremiumAcc'],
      vouchersList: map['vouchersList'] != null
          ? List<String>.from(map['vouchersList'])
          : null,
      favoriteList: map['favoriteList'] != null
          ? List<MenuItemModel>.from(
              map['favoriteList']?.map((x) => MenuItemModel.fromMap(x)))
          : null,
      visaNumber: map['visaNumber'],
      location: map['location'],
      profilePhotoUrl: map['profilePhotoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));
}
