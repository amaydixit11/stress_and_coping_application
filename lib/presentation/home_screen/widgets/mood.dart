import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/domain/mood/mood_provider.dart';

class MoodSelect extends StatefulWidget {
  final String userID;

  const MoodSelect({
    super.key,
    required this.userID,
  });

  @override
  State<MoodSelect> createState() => _MoodSelectState();
}

class _MoodSelectState extends State<MoodSelect> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    void _onTap(int index) async {
      MoodProvider moodProvider = MoodProvider();
      await moodProvider.saveMood(
        widget.userID,
        index,
      ); // Save the mood with userID
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // The rectangle container with a gap for the text
                Positioned(
                  bottom: screenHeight * 0.021,
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFB5F2FF),
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(10000.0),
                    ),
                  ),
                ),
                // Adding the text at the top without background obstruction
                Positioned(
                  top: 0,
                  child: Container(
                    color: Colors.transparent, // Transparent background
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "How are you feeling right now?",
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: screenHeight * 0.0225,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // The emojis placed horizontally below the text
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EmojiWidget(
                          emojiPath: 'assets/images/cry.png',
                          size: screenHeight * 0.05,
                          onTap: () => _onTap(0),
                        ),
                        const SizedBox(width: 7),
                        EmojiWidget(
                          emojiPath: 'assets/images/sad.png',
                          size: screenHeight * 0.05,
                          onTap: () => _onTap(1),
                        ),
                        const SizedBox(width: 7),
                        EmojiWidget(
                          emojiPath: 'assets/images/bored.png',
                          size: screenHeight * 0.05,
                          onTap: () => _onTap(2),
                        ),
                        const SizedBox(width: 7),
                        EmojiWidget(
                          emojiPath: 'assets/images/smile.png',
                          size: screenHeight * 0.05,
                          onTap: () => _onTap(3),
                        ),
                        const SizedBox(width: 7),
                        EmojiWidget(
                          emojiPath: 'assets/images/laugh.png',
                          size: screenHeight * 0.05,
                          onTap: () => _onTap(4),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmojiWidget extends StatelessWidget {
  final String emojiPath;
  final double size;
  final String label;
  final VoidCallback onTap;

  const EmojiWidget({
    Key? key,
    required this.emojiPath,
    required this.size,
    required this.onTap,
    this.label = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: Image.asset(
              emojiPath,
              fit: BoxFit.contain,
            ),
          ),
          if (label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
