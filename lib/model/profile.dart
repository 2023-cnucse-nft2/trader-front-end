import 'package:nft2_trader_front_end/model/membership.dart';

class Profile {
  String name;
  String publicAddress;
  String? balance = "0";
  List<Membership>? memberships = [];

  Profile({
    required this.name,
    required this.publicAddress,
    this.balance,
    this.memberships,
  });
}

class KeyPair {
  String walletAddress;
  String privateKey;

  KeyPair({required this.walletAddress, required this.privateKey});
}
