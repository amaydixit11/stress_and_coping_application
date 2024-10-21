import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/domain/fact_of_the_day/fact_of_the_day_provider.dart';

class FactOfTheDayWidget extends StatefulWidget {
  const FactOfTheDayWidget({super.key});

  @override
  State<FactOfTheDayWidget> createState() => _FactOfTheDayWidgetState();
}

class _FactOfTheDayWidgetState extends State<FactOfTheDayWidget> {
  final StressFacts stressFacts = StressFacts();
  String currentFact = '';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    currentFact = stressFacts.getRandomFact();
    timer = Timer.periodic(Duration(seconds: 8), (Timer t) {
      setState(() {
        currentFact = stressFacts.getRandomFact();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.only(left: screenWidth * 0.01, right: screenWidth * 0.01),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: appTheme.gray90004,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: screenWidth * 0.005),
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                Text("Fact of the day",
                    style: TextStyle(
                      color: appTheme.teal30001,
                      fontSize: 22,
                    )),
                SizedBox(height: screenWidth * 0.01),
                Container(
                  height: 100,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      currentFact,
                      key: ValueKey<String>(currentFact),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium!.leagueSpartan,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
        ],
      ),
    );
  }
}
