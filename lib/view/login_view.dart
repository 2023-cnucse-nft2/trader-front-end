import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/intent/login_logic.dart';
import 'package:nft2_trader_front_end/model/app_state.dart';
import 'package:nft2_trader_front_end/model/profile.dart';
import 'package:nft2_trader_front_end/util/design_kit.dart';
import 'package:nft2_trader_front_end/util/styled_component.dart';
import 'package:nft2_trader_front_end/util/util.dart';
import 'package:nft2_trader_front_end/view/lobby.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String addr = '';
  String private = '';

  TextEditingController _addrController = TextEditingController();
  TextEditingController _privateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignKit.featherGreen,
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: DesignKit.getWidth(context, 25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: DesignKit.getHeight(context, 60)),
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                width: DesignKit.getWidth(context, 340),
                height: DesignKit.getHeight(context, 91),
              ),
            ),
            Column(
              children: <Widget>[
                TextField(
                  controller: _addrController,
                  style: TextStyle(
                    fontSize: DesignKit.getFontSize(context, 12),
                  ),
                  onChanged: (value) => addr = value,
                  decoration: InputDecoration(hintText: '지갑 주소'),
                ),
                TextField(
                  controller: _privateController,
                  style: TextStyle(
                    fontSize: DesignKit.getFontSize(context, 12),
                  ),
                  onChanged: (value) => private = value,
                  decoration: InputDecoration(hintText: '암호 키'),
                ),
              ]
                  .map((widget) => Padding(
                        padding: EdgeInsets.only(
                          bottom: DesignKit.getHeight(context, 30),
                        ),
                        child: widget,
                      ))
                  .toList(),
            ),
            Column(
              children: [
                SwingElevatedButton(
                  onPressed: () {
                    // TODO: 지갑생성 기능 구현
                    showModalBottomSheet<KeyPair>(
                      context: context,
                      builder: (BuildContext context) {
                        return MakeWalletModal();
                      },
                    ).then((keyPair) => setState(() {
                          _addrController.text = keyPair!.walletAddress;
                          _privateController.text = keyPair.privateKey;
                        }));
                  },
                  text: '지갑 생성',
                ),
                SwingElevatedButton(
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
                  text: '로그인',
                ),
              ]
                  .map((widget) => Padding(
                        padding: EdgeInsets.only(
                          top: DesignKit.getHeight(context, 30),
                        ),
                        child: widget,
                      ))
                  .toList(),
            ),
          ],
        ),
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
  String walletAddress = '0xb8ce9ab6943e0eced004cde8e3bbed6568b2fa01';
  String privateKey =
      '0x348ce564d427a3311b6536bbcff9390d69395b06ed6c486954e971d960fe8709';
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DesignKit.getHeight(context, 336),
      child: Column(
        children: success
            ? [
                Container(
                  width: DesignKit.getWidth(context, 340),
                  height: DesignKit.getHeight(context, 180),
                  margin: EdgeInsets.only(
                    top: DesignKit.getHeight(context, 25),
                  ),
                  decoration: DottedDecoration(
                    shape: Shape.box,
                    color: DesignKit.lightDirtGreen,
                    strokeWidth: 4,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        DesignKit.getWidth(context, 30),
                      ),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: DesignKit.getHeight(context, 5),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(
                        context,
                        KeyPair(
                          walletAddress: walletAddress,
                          privateKey: privateKey,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/wallet_icon.svg',
                            width: DesignKit.getWidth(context, 340),
                            height: DesignKit.getHeight(context, 200),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: DesignKit.getHeight(context, 25),
                              left: DesignKit.getWidth(context, 15),
                              right: DesignKit.getWidth(context, 15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TODO: 지갑 생성하고 그 값 보여주기
                                PlainText14(
                                  '지갑 주소\n$walletAddress',
                                  textColor: Colors.white,
                                ),
                                PlainText14(
                                  '암호 키\n$privateKey',
                                  textColor: Colors.white,
                                )
                              ]
                                  .map((widget) => Padding(
                                        padding: EdgeInsets.only(
                                          bottom:
                                              DesignKit.getHeight(context, 15),
                                        ),
                                        child: widget,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: DesignKit.getHeight(context, 25),
                  ),
                  child: const BoldText18(
                    '지갑을 눌러 사용하세요',
                    textColor: DesignKit.lightDirtGreen,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: DesignKit.getHeight(context, 20),
                  ),
                  child: const PlainText12(
                    '반드시 지갑 정보를 기록하세요. 분실의 책임은 본인에게 있습니다.',
                    textColor: DesignKit.red,
                  ),
                ),
              ]
            : [
                Container(
                  width: DesignKit.getWidth(context, 340),
                  height: DesignKit.getHeight(context, 180),
                  margin: EdgeInsets.only(
                    top: DesignKit.getHeight(context, 25),
                  ),
                  decoration: DottedDecoration(
                    shape: Shape.box,
                    color: DesignKit.lightDirtGreen,
                    strokeWidth: 4,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        DesignKit.getWidth(context, 30),
                      ),
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () => setState(() => success = true),
                      child: const BoldText18(
                        '이곳을 눌러 지갑을 생성하세요.',
                        textColor: DesignKit.lightDirtGreen,
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
