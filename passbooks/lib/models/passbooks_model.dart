import 'package:flutter/material.dart';

enum DefectType { internal, external, none }

class PassBooksModel {
  PassBooksModel({
    required this.id,
    required this.totalBalance,
    required this.depositList,
    required this.profileList,

  });

  late int id;
  late double totalBalance;
  late List<DepositModel> depositList;
  late List<ProfileModel> profileList;


  factory PassBooksModel.fromJson(Map<String, dynamic> json) {
    return PassBooksModel(
      id: json['id'],
      totalBalance: json['totalBalance'],
      depositList: json['deposits'],
      profileList: json['profileList'],
    );
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['id'] = id;
    m['totalBalance'] = totalBalance;
    m['deposits'] = depositList;
    m['profileList'] = profileList;

    return m;
  }
}

class ProfileModel {
 ProfileModel({
    this.name,
    this.totalBalance,
  });

  late String? name;
  late double? totalBalance;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      totalBalance: json['totalBalance'],
    );
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['name'] = name;
    m['totalBalance'] = totalBalance;
    return m;
  }
}

class DepositModel {
  DepositModel({
    this.name,
    this.createdDate,
    this.amount,
  });

  late String? name;
  late DateTime? createdDate;
  late double? amount;

  factory DepositModel.fromJson(Map<String, dynamic> json) {
    return DepositModel(
      name: json['name'],
      createdDate: json['createdDate'],
      amount: json['amount'],
    );
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['name'] = name;
    m['createdDate'] = createdDate;
    m['amount'] = amount;
    return m;
  }
}

