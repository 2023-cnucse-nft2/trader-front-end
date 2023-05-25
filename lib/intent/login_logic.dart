// TODO: 지갑 로그인 로직 구현
class LoginLogic {
  const LoginLogic();

  static const String masterAddr = '1234';
  static const String masterPrivate = '1234';

  static bool loginAuth(String addr, String private) {
    bool result = false;
    if (addr.length == (40 + 2) && private.length == (64 + 2)) {
      // 현재 형식만 맞으면 통과
      result = true;
    } else {
      // 마스터 키 입력 시 통과
      result = addr == masterAddr && private == masterPrivate;
    }
    return result;
  }
}
