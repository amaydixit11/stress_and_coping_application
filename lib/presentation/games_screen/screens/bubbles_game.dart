import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

class BubbleGame extends StatefulWidget {
  const BubbleGame({super.key});

  @override
  _BubbleGameState createState() => _BubbleGameState();
}

class _BubbleGameState extends State<BubbleGame> with TickerProviderStateMixin {
  final List<BubbleData> bubbles = [];
  final Random _random = Random();
  Timer? _bubbleGeneratorTimer;
  int score = 0;
  Size? screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = MediaQuery.of(context).size;
    if (_bubbleGeneratorTimer == null) {
      _startBubbleGenerator();
    }
  }

  void _startBubbleGenerator() {
    _addBubble(); // Add initial bubbles
    _bubbleGeneratorTimer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) => _addBubble(),
    );
  }

  void _addBubble() {
    if (!mounted || screenSize == null) return;
    if (bubbles.length >= 15) return; // Limit maximum bubbles

    final controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    final sizeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    final bubble = BubbleData(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      position: Offset(
        _random.nextDouble() * (screenSize!.width - 100),
        screenSize!.height + 100,
      ),
      controller: controller,
      sizeController: sizeController,
      size: _random.nextDouble() * 30 + 50, // Random size between 50-80
      color: Color.fromRGBO(
        _random.nextInt(100) + 156,
        _random.nextInt(100) + 156,
        255,
        0.7,
      ),
    );

    setState(() {
      bubbles.add(bubble);
    });

    // Start animations
    controller.forward();
    sizeController.repeat(reverse: true);

    // Remove bubble when it reaches the top
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _removeBubble(bubble.id);
      }
    });
  }

  void _removeBubble(String id, {bool popped = false}) {
    final index = bubbles.indexWhere((b) => b.id == id);
    if (index == -1) return;

    final bubble = bubbles[index];

    if (popped) {
      bubble.isPopping = true;
      bubble.controller.stop();

      setState(() {
        score += 10;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          setState(() {
            bubbles.removeAt(index);
          });
        }
      });
    } else {
      setState(() {
        bubbles.removeAt(index);
      });
    }

    bubble.controller.dispose();
    bubble.sizeController.dispose();
  }

  @override
  void dispose() {
    _bubbleGeneratorTimer?.cancel();
    for (var bubble in bubbles) {
      bubble.controller.dispose();
      bubble.sizeController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (screenSize == null) return const SizedBox.shrink();

    return Stack(
      children: [
        // Background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2196F3), Color(0xFF1565C0)],
            ),
          ),
        ),

        // Score display
        Positioned(
          top: 40,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Score: $score',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // Bubbles
        ...bubbles.map((bubble) {
          return AnimatedBuilder(
            animation: bubble.controller,
            builder: (context, child) {
              final heightAnimation = Tween(
                begin: bubble.position.dy,
                end: -100.0,
              ).animate(CurvedAnimation(
                parent: bubble.controller,
                curve: Curves.easeInOut,
              ));

              final sizeAnimation = Tween(
                begin: bubble.size,
                end: bubble.size * 1.2,
              ).animate(CurvedAnimation(
                parent: bubble.sizeController,
                curve: Curves.easeInOut,
              ));

              // Horizontal floating movement
              final wobbleAnimation = Tween(
                begin: bubble.position.dx - 20.0,
                end: bubble.position.dx + 20.0,
              ).animate(CurvedAnimation(
                parent: bubble.controller,
                curve: Curves.easeInOut,
              ));

              return Positioned(
                left: wobbleAnimation.value,
                top: heightAnimation.value,
                child: GestureDetector(
                  onTapDown: (_) => _removeBubble(bubble.id, popped: true),
                  child: bubble.isPopping
                      ? _buildPopAnimation(sizeAnimation.value)
                      : _buildBubble(bubble.color, sizeAnimation.value),
                ),
              );
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildBubble(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(0.8),
            color.withOpacity(0.2),
          ],
          stops: const [0.4, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Bubble shine effect
          Positioned(
            top: size * 0.2,
            left: size * 0.2,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopAnimation(double size) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 1.5),
      duration: const Duration(milliseconds: 300),
      builder: (context, double value, child) {
        return Opacity(
          opacity: 1 - (value - 1),
          child: Transform.scale(
            scale: value,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BubbleData {
  final String id;
  final Offset position;
  final AnimationController controller;
  final AnimationController sizeController;
  final double size;
  final Color color;
  bool isPopping = false;

  BubbleData({
    required this.id,
    required this.position,
    required this.controller,
    required this.sizeController,
    required this.size,
    required this.color,
  });
}
