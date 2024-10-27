import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Updated import
import 'code_files.dart'; // Make sure this file is available

class Bubble extends StatefulWidget {
  final String rule;
  final Color ruleColour;
  final Color colour;
  final int ruleNumber;
  final int number;
  final ValueChanged<Move> parentAction;
  final String colorName;
  final int index;

  Bubble({
    required this.rule,
    required this.parentAction,
    required this.index,
    required this.ruleColour,
    required this.colour,
    this.colorName = '', // Default value for colorName
    this.ruleNumber = 1, // Default value for ruleNumber
    this.number = 0, // Default value for number
  });

  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  double width = 80;
  late Color color;

  final AudioPlayer player = AudioPlayer(); // Updated to AudioPlayer

  @override
  void initState() {
    super.initState();
    color = widget.colour;
  }

  @override
  void dispose() {
    player.dispose(); // Dispose of the player properly
    super.dispose();
  }

  void _playSound() async {
    await player.setSource(
        AssetSource('pop.mp3')); // Ensure the sound file exists in the assets
    player.resume(); // Play the sound
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _playSound();
        Move move;

        switch (widget.rule) {
          case 'C':
            move = Move(widget.colorName, widget.index,
                widget.colour == widget.ruleColour);
            break;
          case 'N':
            move = Move(widget.colorName, widget.index,
                widget.number % widget.ruleNumber == 0);
            break;
          case 'NC':
            move = Move(
                widget.colorName,
                widget.index,
                widget.colour == widget.ruleColour &&
                    widget.number % widget.ruleNumber == 0);
            break;
          default:
            move = Move(
                widget.colorName, widget.index, false); // Handle default case
        }

        setState(() {
          width = 0; // Collapse the bubble
          color = Colors.white.withOpacity(0.5); // Change the color on tap
        });

        // Use post frame callback to ensure the widget is still mounted
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            widget.parentAction(move);
          }
        });
      },
      child: AnimatedContainer(
        child: widget.number != null
            ? Center(
                child: Text(
                  widget.number.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              )
            : Container(),
        height: width,
        width: width,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFFFFFF),
              blurRadius: 25,
              spreadRadius: -10,
              offset: Offset(10, -20),
            ),
          ],
        ),
      ),
    );
  }
}
