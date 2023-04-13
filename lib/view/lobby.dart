import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/model/app_state.dart';
import 'package:nft2_trader_front_end/view/order_book.dart';
import 'package:nft2_trader_front_end/view/profile_view.dart';
import 'package:provider/provider.dart';

class Lobby extends StatelessWidget {
  const Lobby({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trade777'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileView(),
              ));
            },
            icon: Image(image: AssetImage('assets/images/profile_icon.png')),
          )
        ],
      ),
      body: MembershipList(),
    );
  }
}

class MembershipList extends StatelessWidget {
  const MembershipList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: appState.golfFieldList
            .map((e) => OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderBook(fieldData: e),
                    ));
                  },
                  child: Column(
                    children: [
                      Text(e.name),
                      Text(
                          '${e.priceList[e.priceList.length - 2]} -> ${e.priceList[e.priceList.length - 1]}'),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
