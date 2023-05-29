import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft2_trader_front_end/model/app_state.dart';
import 'package:nft2_trader_front_end/model/golf_field.dart';
import 'package:nft2_trader_front_end/util/design_kit.dart';
import 'package:nft2_trader_front_end/util/styled_component.dart';
import 'package:nft2_trader_front_end/view/order_book.dart';
import 'package:nft2_trader_front_end/view/profile_view.dart';
import 'package:provider/provider.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: DesignKit.getWidth(context, 10)),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/logo.svg',
            ),
          ),
        ),
        leadingWidth: DesignKit.getWidth(context, 120),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileView(),
              ));
            },
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
            ),
          )
        ],
      ),
      body: MembershipList(),
    );
  }
}

class MembershipList extends StatelessWidget {
  const MembershipList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Center(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: DesignKit.getWidth(context, 25),
          vertical: DesignKit.getHeight(context, 25),
        ),
        children: appState.golfFieldList.map((e) => GcCard(gc: e)).toList(),
      ),
    );
  }
}

class GcCard extends StatelessWidget {
  GolfField gc;

  GcCard({super.key, required this.gc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: DesignKit.getHeight(context, 20)),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderBook(
              fieldData: gc,
            ),
          ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: DesignKit.featherGreen,
          padding: EdgeInsets.symmetric(
            horizontal: DesignKit.getWidth(context, 20),
            vertical: DesignKit.getHeight(context, 10),
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: DesignKit.lightDirtGreen70),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                DesignKit.getWidth(context, 10),
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BoldText24(gc.name),
                SizedBox(
                  width: DesignKit.getWidth(context, 10),
                ),
                PlainText14(
                  gc.fee.toString(),
                  textColor: DesignKit.lightDirtGreen,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: (gc.tradeHistory[gc.tradeHistory.length - 1] -
                          gc.tradeHistory[gc.tradeHistory.length - 2]) >
                      0
                  ? [
                      BoldText18(
                        gc.tradeHistory[gc.tradeHistory.length - 1].toString(),
                        textColor: DesignKit.red,
                      ),
                      SizedBox(
                        height: DesignKit.getHeight(context, 10),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/price_direction/direction_up.svg',
                            height: DesignKit.getHeight(context, 14),
                          ),
                          SizedBox(
                            width: DesignKit.getWidth(context, 10),
                          ),
                          BoldText14(
                            (gc.tradeHistory[gc.tradeHistory.length - 1] -
                                    gc.tradeHistory[gc.tradeHistory.length - 2])
                                .toString(),
                            textColor: DesignKit.red,
                          ),
                        ],
                      ),
                    ]
                  : [
                      BoldText18(
                        gc.tradeHistory[gc.tradeHistory.length - 1].toString(),
                        textColor: DesignKit.blue,
                      ),
                      SizedBox(
                        height: DesignKit.getHeight(context, 10),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/price_direction/direction_down.svg',
                            height: DesignKit.getHeight(context, 14),
                          ),
                          SizedBox(
                            width: DesignKit.getWidth(context, 10),
                          ),
                          BoldText14(
                            (gc.tradeHistory[gc.tradeHistory.length - 2] -
                                    gc.tradeHistory[gc.tradeHistory.length - 1])
                                .toString(),
                            textColor: DesignKit.blue,
                          ),
                        ],
                      ),
                    ],
            ),
          ],
        ),
      ),
    );
  }
}
