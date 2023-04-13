// TODO: 지갑 로그인 로직 구현
class LoginLogic {
  const LoginLogic();

  static const String masterAddr = '1234';
  static const String masterPrivate = '1234';

  static bool loginAuth(String addr, String private) {
    return addr == masterAddr && private == masterPrivate;
  }
}
