class GolfField {
  GolfField({
    required this.name,
    required this.priceList,
    this.spec = "골프장 정보가 없습니다",
  });

  String name;
  List<String> priceList;
  String spec;
}
