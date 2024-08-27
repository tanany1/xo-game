import 'package:flutter/material.dart';
import 'package:xo_game/screens/xo_gameboard.dart';
import 'package:xo_game/screens/xo_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        XoGameBoard.route:(_)=>XoGameBoard(),
        XoSplash.route:(_)=>XoSplash(),
      },
      initialRoute: XoSplash.route,
    );
  }
}
