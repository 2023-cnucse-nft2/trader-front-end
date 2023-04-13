import 'package:nft2_trader_front_end/model/membership.dart';

class Profile {
  Profile({
    required this.name,
    required this.publicAddress,
    this.balance,
    this.memberships,
  });

  String name;
  String publicAddress;
  String? balance = "0";
  List<MemberShip>? memberships = [];
}
