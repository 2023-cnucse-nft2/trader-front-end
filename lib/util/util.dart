class Util {
  static String balanceToString(String amount) {
    String result = '';
    while (amount.length <= 18) {
      amount = '0$amount';
    }
    List<String> tmp = amount.split('');
    tmp.insert(tmp.length - 18, '.');

    for (int i = 0; i < 9; i++) {
      tmp.removeLast();
    }
    tmp.add('-');
    return tmp.join();
  }
}
