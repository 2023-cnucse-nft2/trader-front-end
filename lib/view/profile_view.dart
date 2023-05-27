import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft2_trader_front_end/model/app_state.dart';
import 'package:nft2_trader_front_end/model/membership.dart';
import 'package:nft2_trader_front_end/util/styled_component.dart';
import 'package:nft2_trader_front_end/util/util.dart';
import 'package:nft2_trader_front_end/util/design_kit.dart';
import 'package:nft2_trader_front_end/view/lobby.dart';
import 'package:provider/provider.dart';

import '../model/golf_field.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: DesignKit.getWidth(context, 10)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/icons/logo.svg',
            ),
          ),
        ),
        leadingWidth: DesignKit.getWidth(context, 120),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SectionBox(
            label: '프로필',
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/wallet_icon.svg',
                      width: DesignKit.getWidth(context, 340),
                      height: DesignKit.getHeight(context, 200),
                    ),
                    Container(
                      height: DesignKit.getHeight(context, 125),
                      margin: EdgeInsets.only(
                        top: DesignKit.getHeight(context, 30),
                        bottom: DesignKit.getHeight(context, 15),
                        left: DesignKit.getWidth(context, 15),
                        right: DesignKit.getWidth(context, 15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PlainText14(
                            '지갑 주소\n${appState.user.publicAddress}',
                            textColor: Colors.white,
                          ),
                          SwingElevatedButton(
                            onPressed: () {},
                            text: '암호 키 확인',
                            width: 310,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: DesignKit.getHeight(context, 6),
                            horizontal: DesignKit.getWidth(context, 10),
                          ),
                          decoration: BoxDecoration(
                            color: DesignKit.lightDirtGreen,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                DesignKit.getWidth(context, 10),
                              ),
                            ),
                          ),
                          child: const BoldText18(
                            "ETH",
                            textColor: DesignKit.featherGreen,
                          ),
                        ),
                        BoldText24(
                          Util.balanceToString(
                            appState.user.balance.toString(),
                          ),
                        )
                      ],
                    ),
                    PlainText14('KRW ${appState.user.balance.toString()}'),
                  ],
                ),
              ],
            ),
          ),
          SectionBox(
            label: '회원권',
            child: SizedBox(
              width: DesignKit.getWidth(context, 340),
              child: Column(
                children: appState.user.memberships!
                    .map((e) => MembershipTicket(membership: e))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MembershipTicket extends StatelessWidget {
  Membership membership;

  MembershipTicket({super.key, required this.membership});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('dfsdf');
      },
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/ticket_frame/ticket_frame_notSale.svg',
          ),
          Padding(
            padding: EdgeInsets.only(
              top: DesignKit.getHeight(context, 10),
              bottom: DesignKit.getHeight(context, 10),
              left: DesignKit.getWidth(context, 35),
              right: DesignKit.getWidth(context, 20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText18(membership.field.name),
                    PlainText14('King Wang Zzang'),
                  ],
                ),
                Container(
                  width: DesignKit.getWidth(context, 90),
                  decoration: DottedDecoration(
                    color: DesignKit.heavyDirtGreen,
                    linePosition: LinePosition.left,
                    dash: [2, 2],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: (membership.field.tradeHistory[
                                    membership.field.tradeHistory.length - 1] -
                                membership.purchasePrice) >
                            0
                        ? [
                            BoldText18(
                              membership
                                  .field
                                  .tradeHistory[
                                      membership.field.tradeHistory.length - 1]
                                  .toString(),
                              textColor: DesignKit.red,
                            ),
                            SizedBox(
                              height: DesignKit.getHeight(context, 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/price_direction/direction_up.svg',
                                  height: DesignKit.getHeight(context, 14),
                                ),
                                SizedBox(
                                  width: DesignKit.getWidth(context, 10),
                                ),
                                BoldText14(
                                  (membership.field.tradeHistory[membership
                                                  .field.tradeHistory.length -
                                              1] -
                                          membership.purchasePrice)
                                      .toString(),
                                  textColor: DesignKit.red,
                                ),
                              ],
                            ),
                          ]
                        : [
                            BoldText18(
                              membership
                                  .field
                                  .tradeHistory[
                                      membership.field.tradeHistory.length - 1]
                                  .toString(),
                              textColor: DesignKit.blue,
                            ),
                            SizedBox(
                              height: DesignKit.getHeight(context, 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/price_direction/direction_down.svg',
                                  height: DesignKit.getHeight(context, 14),
                                ),
                                SizedBox(
                                  width: DesignKit.getWidth(context, 10),
                                ),
                                BoldText14(
                                  (membership.purchasePrice -
                                          membership.field.tradeHistory[
                                              membership.field.tradeHistory
                                                      .length -
                                                  1])
                                      .toString(),
                                  textColor: DesignKit.blue,
                                ),
                              ],
                            ),
                          ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Row(
      //       children: [
      //         BoldText24(gc.name),
      //         SizedBox(
      //           width: DesignKit.getWidth(context, 10),
      //         ),
      //         PlainText14(
      //           gc.fee.toString(),
      //           textColor: DesignKit.lightDirtGreen,
      //         ),
      //       ],
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: (gc.tradeHistory[gc.tradeHistory.length - 1] -
      //                   gc.tradeHistory[gc.tradeHistory.length - 2]) >
      //               0
      //           ? [
      //               BoldText18(
      //                 gc.tradeHistory[gc.tradeHistory.length - 1].toString(),
      //                 textColor: DesignKit.red,
      //               ),
      //               SizedBox(
      //                 height: DesignKit.getHeight(context, 10),
      //               ),
      //               Row(
      //                 children: [
      //                   SvgPicture.asset(
      //                     'assets/icons/direction_up.svg',
      //                     height: DesignKit.getHeight(context, 14),
      //                   ),
      //                   SizedBox(
      //                     width: DesignKit.getWidth(context, 10),
      //                   ),
      //                   BoldText14(
      //                     (gc.tradeHistory[gc.tradeHistory.length - 1] -
      //                             gc.tradeHistory[gc.tradeHistory.length - 2])
      //                         .toString(),
      //                     textColor: DesignKit.red,
      //                   ),
      //                 ],
      //               ),
      //             ]
      //           : [
      //               BoldText18(
      //                 gc.tradeHistory[gc.tradeHistory.length - 1].toString(),
      //                 textColor: DesignKit.blue,
      //               ),
      //               SizedBox(
      //                 height: DesignKit.getHeight(context, 10),
      //               ),
      //               Row(
      //                 children: [
      //                   SvgPicture.asset(
      //                     'assets/icons/direction_down.svg',
      //                     height: DesignKit.getHeight(context, 14),
      //                   ),
      //                   SizedBox(
      //                     width: DesignKit.getWidth(context, 10),
      //                   ),
      //                   BoldText14(
      //                     (gc.tradeHistory[gc.tradeHistory.length - 2] -
      //                             gc.tradeHistory[gc.tradeHistory.length - 1])
      //                         .toString(),
      //                     textColor: DesignKit.blue,
      //                   ),
      //                 ],
      //               ),
      //             ],
      //     ),
      //   ],
      // ),
    );
  }
}
