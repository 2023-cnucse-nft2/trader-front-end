import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/model/golf_field.dart';
import 'package:nft2_trader_front_end/view/joints.dart';
import 'package:nft2_trader_front_end/view/trade_modal.dart';

class OrderBook extends StatelessWidget {
  const OrderBook({super.key, required this.fieldData});

  final GolfField fieldData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원권 호가창'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldData.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Bulkhead(),
          Text(
            "차트",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Placeholder(
            fallbackHeight: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SellModal(
                        fieldName: fieldData.name,
                        price:
                            fieldData.priceList[fieldData.priceList.length - 1],
                      );
                    },
                  );
                },
                child: Text("매도"),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BuyModal(
                        fieldName: fieldData.name,
                        price:
                            fieldData.priceList[fieldData.priceList.length - 1],
                      );
                    },
                  );
                },
                child: Text("매수"),
              ),
            ],
          ),
          Bulkhead(),
          Text(
            "골프장 정보",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(fieldData.spec),
        ],
      ),
    );
  }
}
