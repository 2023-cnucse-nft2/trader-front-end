// TODO: 지갑 로그인 로직 구현
import 'package:nft2_trader_front_end/model/app_state.dart';

class LoginIntents {
  static const String _masterAddr = '1234';
  static const String _masterPrivate = '1234';
  static final _appState = AppState();

  static bool loginAuth(String addr, String private) {
    bool result = false;
    if (addr.length == (40 + 2) && private.length == (64 + 2)) {
      // TODO: 현재 형식만 맞으면 통과 로직 수정하기
      result = true;

      // TODO: 앱 상태 변경
      _appState.user.publicAddress = addr;
    } else {
      // 마스터 키 입력 시 통과
      result = addr == _masterAddr && private == _masterPrivate;
    }
    return result;
  }
}
