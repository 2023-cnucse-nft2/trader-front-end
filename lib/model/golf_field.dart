class GolfField {
  String name;
  List<int> tradeHistory;
  int fee;
  String spec;

  GolfField({
    required this.name,
    required this.tradeHistory,
    required this.fee,
    this.spec = "골프장 정보가 없습니다",
  });
}

// dummy data
GolfField yuseongCC = GolfField(
  name: '유성CC',
  tradeHistory: [
    3100,
    3300,
    3100,
    3100,
    2700,
    2400,
    2700,
    2400,
    2800,
    3000,
    3500
  ],
  fee: 55,
  spec:
      "정회원 1인\n평일 1부 : 95,000 / 2부 : 100,000 / 주말 : 109,000\n※ 계절요금 적용 (4/1 ~ 4/31)\n\n대전 도심지역에 위치한 유일한 회원제 골프장입니다.\n울창한 수목들과 국가 보호수도 많은 곳으로, 적당한 넓이의 페어웨이와 약간 짧은 전장으로 구성되어 있습니다.",
);

GolfField hanhwaResort = GolfField(
  name: '한화리조트',
  tradeHistory: [14300, 13700],
  fee: 22,
  spec: "????",
);
