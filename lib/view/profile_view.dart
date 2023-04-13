import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/model/app_state.dart';
import 'package:nft2_trader_front_end/model/membership.dart';
import 'package:nft2_trader_front_end/util.dart';
import 'package:nft2_trader_front_end/view/joints.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필 정보'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("잔고"),
          Text("${Util.printEth(appState.user.balance!)} ETH"),
          Bulkhead(),
          Text("보유중인 회원권"),
          appState.user.memberships != null
              ? Column(
                  children: appState.user.memberships!
                      .map((e) => MemberShipWidget(memberShip: e))
                      .toList(),
                )
              : Text("회원권이 없습니다"),
          Bulkhead(),
          Text("매물로 내놓은 회원권"),
          // TODO: Model 나오고 나서 구현
          Bulkhead(),
          Text("진행중인 거래"),
          // TODO: Model 나오고 나서 구현
        ],
      ),
    );
  }
}

class MemberShipWidget extends StatelessWidget {
  const MemberShipWidget({super.key, required this.memberShip});

  final MemberShip memberShip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(),
      ),
      child: Column(children: [
        Text(memberShip.fieldName),
        Text(memberShip.price),
      ]),
    );
  }
}
