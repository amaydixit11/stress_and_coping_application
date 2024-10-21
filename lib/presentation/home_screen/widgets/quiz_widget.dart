import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    double cardWidth = screenWidth * 0.4;
    double cardHeight = cardWidth * 0.72;

    void _onTap() {
      // TODO: Navigate to quiz question page
      // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizQuestionPage()));
    }
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: screenWidth * 0.005, right: screenWidth * 0.005),
        padding: EdgeInsets.all(screenWidth * 0.015),
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: cardWidth,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.zero,
              color: appTheme.gray90004,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Container(
                height: cardHeight,
                width: cardWidth,
                decoration: BoxDecoration(
                  color: appTheme.gray90004,
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgHomeQuizQuestionMark,
                      height: cardHeight * 1.5,
                      width: cardWidth * 0.8,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        // width: cardWidth * 0.6,
                        margin: EdgeInsets.only(
                          left: cardWidth * 0.1,
                          top: cardHeight * 0.1,
                        ),
                        child: Text(
                          "Take Today's \nQuiz",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall!.poppins.copyWith(
                            fontSize: 8.fSize,
                            // height: 1.47,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
