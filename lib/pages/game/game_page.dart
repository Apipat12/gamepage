import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../game.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  var game = Game(maxRandom: 100);
  var feedbackText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.accessibility,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: 10),
            Text('GUESS THE NUMBER'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(

                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Text(
                      'Please guess the number between 1 and 100',
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your guess',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: OutlinedButton(
                      onPressed: () {
                        //todo:
                        var input = _controller.text;
                        var guess = int.tryParse(input);
                        var result = game.doGuess(guess!);
                        if (result == GuessResult.correct) {
                          setState(() {
                            feedbackText = 'Correct';
                          });
                        } else if (result == GuessResult.tooHigh) {
                          setState(() {
                            feedbackText = 'TooHigh , Try again!';
                          });
                        } else {
                          setState(() {
                            feedbackText = 'TooLow, Try again!';
                          });
                        }
                      },
                      child: Text('GUESS'),
                    ),
                  )
                ],
              ),
            ),
            Text(feedbackText)
          ],
        ),
      ),
    );
  }
}
