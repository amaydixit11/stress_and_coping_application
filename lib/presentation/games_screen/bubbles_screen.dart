import 'dart:math';
import 'package:flutter/material.dart';

class BubblesScreen extends StatefulWidget {
  final List<NavigationItem> menuItems;

  const BubblesScreen({
    super.key,
    required this.menuItems,
  });

  @override
  _BubblesScreenState createState() => _BubblesScreenState();
}

class _BubblesScreenState extends State<BubblesScreen>
    with TickerProviderStateMixin {
  final List<BubbleData> bubbles = [];
  final Random _random = Random();
  Size? screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = MediaQuery.of(context).size;
    if (bubbles.isEmpty) {
      _initializeBubbles();
    }
  }

  void _initializeBubbles() {
    if (!mounted || screenSize == null) return;

    // Clear existing bubbles
    for (var bubble in bubbles) {
      // bubble.popCrontroller.dispose();
      bubble.sizeController.dispose();
      bubble.floatController.dispose();
    }
    bubbles.clear();

    // Create bubbles for each menu item
    for (int i = 0; i < widget.menuItems.length; i++) {
      final floatController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );

      final sizeController = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );

      // Calculate position in a circular pattern
      final angle = (2 * pi * i) / widget.menuItems.length;
      final radius = screenSize!.width * 0.3;
      final centerX = screenSize!.width / 2;
      final centerY = screenSize!.height / 2;

      final bubble = BubbleData(
        id: i.toString(),
        position: Offset(
          centerX + radius * cos(angle) - 40,
          centerY + radius * sin(angle) - 40,
        ),
        floatController: floatController,
        sizeController: sizeController,
        // popController: null, // No pop controller for this effect
        size: 80,
        color: widget.menuItems[i].color ??
            Color.fromRGBO(
              _random.nextInt(50) + 50,
              _random.nextInt(50) + 50,
              _random.nextInt(50) + 100,
              0.8,
            ),
        label: widget.menuItems[i].label,
        onTap: widget.menuItems[i].onTap,
      );

      bubbles.add(bubble);
      floatController.repeat();
      sizeController.repeat(reverse: true);
    }
  }

  void _handleBubbleTap(BubbleData bubble) async {
    bubble.floatController.stop();

    // Expand animation
    bubble.sizeController.forward().then((_) {
      // Navigate after size is expanded
      bubble.onTap();

      // Delay before collapsing back
      Future.delayed(const Duration(milliseconds: 300), () {
        bubble.sizeController.reverse();
      });
    });
  }

  @override
  void dispose() {
    for (var bubble in bubbles) {
      bubble.floatController.dispose();
      bubble.sizeController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (screenSize == null) return const SizedBox.shrink();

    return Stack(
      children: [
        // Dark theme background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1A1A1A), Color(0xFF0A0A0A)],
            ),
          ),
        ),

        // Menu title
        const Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
        ),

        // Floating bubbles
        ...bubbles.map((bubble) {
          return AnimatedBuilder(
            animation: Listenable.merge([
              bubble.floatController,
              bubble.sizeController,
            ]),
            builder: (context, child) {
              // Float animation
              final floatAnimation = Tween(
                begin: bubble.position.dy - 15.0,
                end: bubble.position.dy + 15.0,
              ).animate(CurvedAnimation(
                parent: bubble.floatController,
                curve: Curves.easeInOut,
              ));

              // Size animation
              final sizeAnimation = Tween(
                begin: bubble.size,
                end: bubble.size * 1.3, // Increased scale for better visibility
              ).animate(CurvedAnimation(
                parent: bubble.sizeController,
                curve: Curves.easeInOut,
              ));

              return Positioned(
                left: bubble.position.dx,
                top: floatAnimation.value,
                child: GestureDetector(
                  onTap: () => _handleBubbleTap(bubble),
                  child: _buildBubble(
                    bubble.color,
                    sizeAnimation.value,
                    bubble.label,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildBubble(Color color, double size, String label) {
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
            color: color.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 10),
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
          // Label
          Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationItem {
  final String label;
  final VoidCallback onTap;
  final Color? color;

  NavigationItem({
    required this.label,
    required this.onTap,
    this.color,
  });
}

class BubbleData {
  final String id;
  final Offset position;
  final AnimationController floatController;
  final AnimationController sizeController;
  final double size;
  final Color color;
  final String label;
  final VoidCallback onTap;

  BubbleData({
    required this.id,
    required this.position,
    required this.floatController,
    required this.sizeController,
    required this.size,
    required this.color,
    required this.label,
    required this.onTap,
  });
}
