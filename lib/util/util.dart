class Util {
  static String balanceToString(String amount) {
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

  static String toLocaleString(String price) {
    List<String> tmp = price.split('');

    for (int i = tmp.length - 3; i > 0; i -= 3) {
      tmp.insert(i, ',');
    }

    return tmp.join();
  }
}
