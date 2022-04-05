import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int currentTurn = 1;
  int won = 0;
  List<int> score = [0, 0];

  void roll() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      score[currentTurn - 1] += leftDiceNumber + rightDiceNumber;
      if (score[currentTurn - 1] >= 200) {
        won = 1;
        return;
      }
      currentTurn = (currentTurn == 1) ? 2 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: const Text(
              "Current Turn",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              won == 0
                  ? "Player $currentTurn"
                  : "Noice! Player $currentTurn wins",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'mono',
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Player 1 Score: ${score[0]}"),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Player 2 Score: ${score[1]}"),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                  onPressed: () {
                    (won == 0) ? roll() : 'sss';
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                  onPressed: () {
                    (won == 0) ? roll() : 'sss';
                  },
                ),
              ),
            ],
          ),
          TextButton(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16.0),
                child: const Text("Reset",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    )),
              ),
              onPressed: () {
                setState(() {
                  leftDiceNumber = 1;
                  rightDiceNumber = 1;
                  currentTurn = 1;
                  won = 0;
                  score = [0, 0];
                });
              }),
        ],
      ),
    );
  }
}
