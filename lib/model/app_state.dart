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
      Membership(
        field: yuseongCC,
        purchasePrice: 3400,
      ),
      Membership(
        field: hanhwaResort,
        purchasePrice: 12800,
      ),
    ],
  );
  final List<GolfField> golfFieldList = [
    yuseongCC,
    hanhwaResort,
  ];
}
