import 'package:flutter/material.dart';

class BuyModal extends StatelessWidget {
  const BuyModal({super.key, required this.fieldName, required this.price});

  final String fieldName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("이름 : $fieldName"),
          Text("가격 : $price만원"),
          ElevatedButton(
            onPressed: () {
              // 매수 요청 API 꽂기
              Navigator.pop(context);
            },
            child: Text("매수 요청"),
          ),
        ],
      ),
    );
  }
}

class SellModal extends StatelessWidget {
  const SellModal({super.key, required this.fieldName, required this.price});

  final String fieldName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("이름 : $fieldName"),
          Text("최근 거래가 : $price만원"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("호가"),
              Container(
                width: 100,
                margin: EdgeInsets.only(left: 20),
                child: TextField(),
              ),
              Text("만원"),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // 매도 요청 API 꽂기
              Navigator.pop(context);
            },
            child: Text("매물 등록"),
          ),
        ],
      ),
    );
  }
}
