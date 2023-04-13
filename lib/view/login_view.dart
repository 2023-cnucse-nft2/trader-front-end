import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/intent/login_logic.dart';
import 'package:nft2_trader_front_end/model/app_state.dart';
import 'package:nft2_trader_front_end/util.dart';
import 'package:nft2_trader_front_end/view/lobby.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    String addr = '';
    String private = '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(onChanged: (value) => addr = value),
          TextField(onChanged: (value) => private = value),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: 지갑생성 기능 구현
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return MakeWalletModal();
                    },
                  );
                },
                child: Text('지갑생성'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (LoginLogic.loginAuth(addr, private)) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Lobby(),
                    ));
                    // setState(() => logined = true);
                  } else {
                    print('Login Denied!');
                  }
                },
                child: Text('로그인'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MakeWalletModal extends StatefulWidget {
  const MakeWalletModal({super.key});

  @override
  State<MakeWalletModal> createState() => _MakeWalletModalState();
}

class _MakeWalletModalState extends State<MakeWalletModal> {
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: success
            ? Text(
                "Public Address : 0x329879342782\nPrivate Address : 0x82138772377")
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                ),
                onPressed: () {
                  // TODO : 지갑 생성 로직 연결하기
                  setState(() => success = true);
                },
                child: Text("지갑 생성"),
              ),
      ),
    );
  }
}
