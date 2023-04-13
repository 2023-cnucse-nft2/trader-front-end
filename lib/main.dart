import 'package:flutter/material.dart';
import 'package:nft2_trader_front_end/model/app_state.dart';
import 'package:provider/provider.dart';
import 'package:nft2_trader_front_end/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorSchemeSeed: const Color.fromARGB(255, 5, 118, 54),
    //   ),
    //   home: ChangeNotifierProvider(
    //     create: (context) => AppState(),
    //     child: LoginView(),
    //   ),
    // );

    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorSchemeSeed: const Color.fromARGB(255, 5, 118, 54),
          ),
          home: LoginView()),
    );
  }
}
