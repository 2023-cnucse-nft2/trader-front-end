import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft2_trader_front_end/model/golf_field.dart';
import 'package:nft2_trader_front_end/util/styled_component.dart';
import 'package:nft2_trader_front_end/view/lobby.dart';
import 'package:nft2_trader_front_end/view/profile_view.dart';
import 'package:nft2_trader_front_end/view/trade_modal.dart';
import 'package:nft2_trader_front_end/util/design_kit.dart';

class OrderBook extends StatelessWidget {
  final GolfField fieldData;

  const OrderBook({super.key, required this.fieldData});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfileView(),
              ));
            },
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DesignKit.getHeight(context, 25),
              horizontal: DesignKit.getWidth(context, 25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GcCard(gc: fieldData),
                GcChart(tradeHistory: fieldData.tradeHistory),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: DesignKit.getHeight(context, 10),
                  ),
                  child: SwingElevatedButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SellModal(
                            fieldName: fieldData.name,
                            price: fieldData
                                .tradeHistory[fieldData.tradeHistory.length - 1]
                                .toString(),
                          );
                        },
                      );
                    },
                    text: "거래 상세 내역 보기",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SellModal(
                              fieldName: fieldData.name,
                              price: fieldData.tradeHistory[
                                      fieldData.tradeHistory.length - 1]
                                  .toString(),
                            );
                          },
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: DesignKit.blue,
                        fixedSize: Size.fromWidth(
                          DesignKit.getWidth(context, 160),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              DesignKit.getWidth(context, 10),
                            ),
                          ),
                        ),
                      ),
                      child: Text("매도"),
                    ),
                    FilledButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return BuyModal(
                              fieldName: fieldData.name,
                              price: fieldData.tradeHistory[
                                      fieldData.tradeHistory.length - 1]
                                  .toString(),
                            );
                          },
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: DesignKit.red,
                        fixedSize: Size.fromWidth(
                          DesignKit.getWidth(context, 160),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              DesignKit.getWidth(context, 10),
                            ),
                          ),
                        ),
                      ),
                      child: Text("매수"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SectionBox(
            label: '골프장 정보',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlainText14(fieldData.spec),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GcChart extends StatelessWidget {
  List<int> tradeHistory;

  GcChart({super.key, required this.tradeHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DesignKit.getWidth(context, 340),
      height: DesignKit.getHeight(context, 180),
      margin: EdgeInsets.only(bottom: DesignKit.getHeight(context, 20)),
      decoration: BoxDecoration(
        border: Border.all(color: DesignKit.heavyDirtGreen),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(DesignKit.getWidth(context, 10)),
        ),
      ),
      // TODO: 차트 그리기
      child: Placeholder(),
    );
  }
}
