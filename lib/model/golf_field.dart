import 'dart:ffi';

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
