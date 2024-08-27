import 'package:flutter/material.dart';
import 'package:xo_game/model/GameBoardArgs.dart';
import 'package:xo_game/screens/xo_gameboard.dart';

class XoSplash extends StatelessWidget {
  static const String route="splash";
  XoSplash({super.key});
  String player1 = "";
  String player2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Splash" , style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Player 1"
              ),
              onChanged: (text){
                player1=text;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Player 2"
              ),
              onChanged: (text){
                player2=text;
              },
            ),
          ),
          const Spacer(flex: 2,),
          Container(
            margin: const EdgeInsets.all(12),
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, XoGameBoard.route,
                arguments: GameBoardArgs(player1, player2)
                );
              }, child: const Text("Start"))),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}
