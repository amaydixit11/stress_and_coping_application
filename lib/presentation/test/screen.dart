import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'code_files.dart';

class BubbleScreen extends StatefulWidget {
  static String id = 'game_screen';

  @override
  _BubbleScreenState createState() => _BubbleScreenState();
}

class _BubbleScreenState extends State<BubbleScreen> {
  final Random random = Random();
  final Map<String, ColorState> colours = {
    'Reds': ColorState(Colors.red),
    'Purples': ColorState(Colors.purple),
    'Yellows': ColorState(Colors.yellow),
    'Blues': ColorState(Colors.cyan),
    'Greens': ColorState(Colors.lightGreenAccent),
  };

  List<BubbleState> bubbles = [];
  int? level;
  String? rule;
  String? ruleColorName;
  int? ruleNumber;
  int? ruleCount;

  Timer? _timer;
  bool correctMove = true, showOverlay = false, gameOver = false;
  int popped = 0;

  late Future<void> loadLevelFuture;

  @override
  void initState() {
    super.initState();
    loadLevelFuture = _loadLevel();
    _loadGame();
  }

  Future<void> _loadLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    level = prefs.getInt('level') ?? 0;
  }

  void _loadGame() {
    rule = kRules.keys.elementAt(random.nextInt(kRules.length));
    ruleColorName = colours.keys.elementAt(random.nextInt(colours.length));
    ruleNumber = 1 + random.nextInt(6 - 1); // Generate a random rule number

    bubbles.clear();
    // Generate bubbles based on the random number and rules
    bubbles = List.generate(
      (6 * 3) + random.nextInt((6 * 4) - 11),
      (index) => BubbleState(
        colorIndex: random.nextInt(colours.length),
        number:
            rule!.contains('N') ? index + 1 : 0, // Use rule to determine number
      ),
    );

    colours.values.forEach((element) {
      element.resetCount(); // Reset the count for each color
    });

    bubbles.forEach((item) {
      colours.values.elementAt(item.colorIndex).incrementCount();
    });

    _determineRuleCount();

    // Reset the game state if the game was previously over
    if (gameOver && showOverlay) {
      setState(() {
        gameOver = false;
        showOverlay = false;
        popped = 0;
        correctMove = true;
      });
    }
  }

  void _determineRuleCount() {
    switch (rule) {
      case 'C':
        ruleCount = colours[ruleColorName]?.count;
        break;
      case 'N':
        ruleCount = (bubbles.length / ruleNumber!).floor();
        break;
      case 'NC':
        ruleCount = bubbles
            .where((element) =>
                element.colorIndex ==
                    colours.keys.toList().indexOf(ruleColorName!) &&
                element.number! % ruleNumber! == 0)
            .length;
        break;
      default:
        ruleCount = 0; // Handle unexpected rule cases
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pop My Bubble!'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: <Widget>[
                FutureBuilder<void>(
                  future: loadLevelFuture,
                  builder: (context, snapshot) {
                    return Text(
                      'Level ${level ?? 0}', // Simplified level display
                      style: TextStyle(fontSize: 22),
                    );
                  },
                ),
                Text(
                  'Pop the ${_getRule(rule!, ruleColorName!, ruleNumber!)}',
                  style: TextStyle(fontSize: 22),
                ),
                Expanded(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    itemCount: bubbles.length,
                    itemBuilder: (context, index) {
                      Color randColor = colours.values
                          .elementAt(bubbles[index].colorIndex)
                          .color;
                      String colorName =
                          colours.keys.elementAt(bubbles[index].colorIndex);
                      return bubbles[index].isActive
                          ? Bubble(
                              rule: rule!,
                              ruleColour: colours[ruleColorName]!.color,
                              colour: randColor,
                              colorName: colorName,
                              ruleNumber:
                                  rule!.contains('N') ? ruleNumber ?? 0 : 0,
                              number: rule!.contains('N') ? index + 1 : 0,
                              parentAction: _updateMove,
                              index: index,
                            )
                          : SizedBox
                              .shrink(); // Use SizedBox.shrink() instead of Container
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {
                if (ruleCount == 0 && popped == 0)
                  _gameWon();
                else
                  _gameOver();
              },
              child: Ink(
                height: kBottomNavigationBarHeight,
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Text(
                    'Don\'t Fool Me!',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          if (showOverlay) // Use if statement to manage overlay visibility
            _buildOverlay(),
        ],
      ),
    );
  }

  Widget _buildOverlay() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                gameOver ? 'GAME OVER' : 'LEVEL UP!',
                style: TextStyle(fontSize: 40),
              ),
              FloatingActionButton.extended(
                label: Text(gameOver ? 'Play Again' : 'Next Level'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, BubbleScreen.id);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getRule(String rule, String colorName, int number) {
    switch (rule) {
      case 'C':
        return colorName;
      case 'N':
        return 'Multiples of $number';
      case 'NC':
        return '$colorName that are Multiples of $number';
      default:
        return colorName;
    }
  }

  void _updateMove(Move currentMove) {
    setState(() {
      correctMove = currentMove.isCorrectMove;
      popped++;
      bubbles[currentMove.index].isActive = false;
      colours[currentMove.colorName]?.decrementCount();
    });

    if (!correctMove) {
      _gameOver();
    } else if (correctMove && popped == ruleCount) {
      _gameWon();
    }
  }

  void _gameOver() {
    setState(() {
      gameOver = true;
      showOverlay = true;
    });
  }

  Future<void> _gameWon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('level', (level ?? 0) + 1);
    setState(() {
      showOverlay = true;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    colours.clear();
    bubbles.clear();
    super.dispose();
  }
}
