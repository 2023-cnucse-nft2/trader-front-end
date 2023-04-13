import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/model/golf_field.dart';
import 'package:nft2_trader_front_end/model/membership.dart';
import 'package:nft2_trader_front_end/model/profile.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;
  AppState._internal();

  final Profile user = Profile(
    name: "정재성",
    publicAddress: "0xabc939cd9ef01",
    balance: "200000000000000000000",
    memberships: [
      MemberShip(fieldName: "유성CC", price: "3500"),
    ],
  );
  final List<GolfField> golfFieldList = [
    GolfField(
      name: '유성CC',
      priceList: ["3000", "3500"],
      spec: "우리 골프장 킹왕짱 좋아요 많이 놀러오세요 @@@@@@@@@@",
    ),
    GolfField(name: '한화리조트', priceList: ["14300", "13700"]),
  ];
}
