import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft2_trader_front_end/model/golf_field.dart';
import 'package:nft2_trader_front_end/util/styled_component.dart';
import 'package:nft2_trader_front_end/util/util.dart';
import 'package:nft2_trader_front_end/view/lobby.dart';
import 'package:nft2_trader_front_end/view/profile_view.dart';
import 'package:nft2_trader_front_end/view/trade_modal.dart';
import 'package:nft2_trader_front_end/util/design_kit.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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
                      child: const BoldText14(
                        "매도",
                        textColor: DesignKit.featherGreen,
                      ),
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
                      child: const BoldText14(
                        "매수",
                        textColor: DesignKit.featherGreen,
                      ),
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
  final List<int> tradeHistory;

  const GcChart({super.key, required this.tradeHistory});

  @override
  Widget build(BuildContext context) {
    int maxValue = tradeHistory.reduce((a, b) => a > b ? a : b);
    int minValue = tradeHistory.reduce((a, b) => a < b ? a : b);

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: DesignKit.getWidth(context, 340),
            padding: EdgeInsets.all(DesignKit.getWidth(context, 5)),
            decoration: DottedDecoration(
              color: DesignKit.red,
              dash: const [2, 2],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BoldText14(
                  Util.toLocaleString(maxValue.toString()),
                  textColor: DesignKit.red,
                ),
              ],
            ),
          ),
          SizedBox(
            height: DesignKit.getHeight(context, 120),
            child: SfSparkLineChart(
              axisLineWidth: 0,
              color: DesignKit.dirtGreen,
              trackball: SparkChartTrackball(
                dashArray: [2, 2],
                activationMode: SparkChartActivationMode.tap,
                // tooltip에 날짜를 볼 수 있도록 모델 및 formatter 재설계
                tooltipFormatter: (details) {
                  return Util.toLocaleString(details.y.toString());
                },
              ),
              data: tradeHistory,
            ),
          ),
          Container(
            width: DesignKit.getWidth(context, 340),
            padding: EdgeInsets.all(DesignKit.getWidth(context, 5)),
            decoration: DottedDecoration(
              linePosition: LinePosition.top,
              color: DesignKit.blue,
              dash: const [2, 2],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BoldText14(
                  Util.toLocaleString(minValue.toString()),
                  textColor: DesignKit.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
