import 'package:flutter/material.dart';
import 'package:xo_game/model/GameBoardArgs.dart';

import '../xo_button.dart';

class XoGameBoard extends StatefulWidget {
  static const String route = "XoGameBoard";

  const XoGameBoard({super.key});

  @override
  State<XoGameBoard> createState() => _XoGameBoardState();
}

class _XoGameBoardState extends State<XoGameBoard> {
  List<String> board=[
    "", "", "",
    "", "", "",
    "", "", "",
  ];
  int counter = 0;
  int player1score= 0 ;
  int player2score= 0 ;
  @override
  Widget build(BuildContext context) {
    //
    GameBoardArgs args =ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    //
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("XO Game Board" , style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: Colors.blueAccent,
        body: Column(
          children: [
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${args.player1}: $player1score", style: TextStyle(fontSize: 32, color: Colors.white),),
                    Text("${args.player2}: $player2score", style: TextStyle(fontSize: 32, color: Colors.white),),
                  ],
                )
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XoButton(symbol: board[0], onClick: onButtonClick,index: 0,),
                  XoButton(symbol: board[1], onClick: onButtonClick,index: 1),
                  XoButton(symbol: board[2], onClick: onButtonClick,index: 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XoButton(symbol: board[3], onClick: onButtonClick,index: 3),
                  XoButton(symbol: board[4], onClick: onButtonClick,index: 4),
                  XoButton(symbol: board[5], onClick: onButtonClick,index: 5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XoButton(symbol: board[6], onClick: onButtonClick,index: 6),
                  XoButton(symbol: board[7], onClick: onButtonClick,index: 7),
                  XoButton(symbol: board[8], onClick: onButtonClick,index: 8),
                ],
              ),
            ),
          ],
        )
    );
  }

  void onButtonClick(int index){
    if(board[index].isNotEmpty) return;
    if(counter%2==0){
    board[index]='O';
    }else{
      board[index]='X';
    }
    if(checkWinner(board[index])){
      ///reset board
      /// increase player score
      if(board[index]=="O"){
        player1score++;
      }else {
        player2score++;
      }
      resetBoard();
      return;
    }
    if(counter==8){
      resetBoard();
      return;
    }
    counter++;
    setState(() {});
  }

  bool checkWinner( String symbol){
    ///Row Check
    if(board[0]==symbol && board[1]==symbol && board[2]==symbol){return true;}
    if(board[3]==symbol && board[4]==symbol && board[5]==symbol){return true;}
    if(board[6]==symbol && board[7]==symbol && board[8]==symbol){return true;}
    ///Column Check
    if(board[0]==symbol && board[3]==symbol && board[6]==symbol){return true;}
    if(board[1]==symbol && board[4]==symbol && board[7]==symbol){return true;}
    if(board[2]==symbol && board[5]==symbol && board[8]==symbol){return true;}
    ///Diagonal Check
    if(board[0]==symbol && board[4]==symbol && board[8]==symbol){return true;}
    if(board[2]==symbol && board[4]==symbol && board[6]==symbol){return true;}
    return false;
  }

  void resetBoard() {
    board=[
      "", "", "",
      "", "", "",
      "", "", "",
    ];
    counter=0;
    setState(() {});
  }
}