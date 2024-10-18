import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';

class StressDataWidget extends StatefulWidget {
  const StressDataWidget({super.key});

  @override
  State<StressDataWidget> createState() => _StressDataWidgetState();
}

class _StressDataWidgetState extends State<StressDataWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Container(
      margin:
          EdgeInsets.only(left: screenWidth * 0.01, right: screenWidth * 0.01),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: appTheme.gray90004,
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenWidth * 0.25,
              width: screenWidth * 0.27,
              margin: EdgeInsets.only(top: screenWidth * 0.01),
              child: Stack(
                alignment: Alignment.center, // Align content to the center
                children: [
                  SizedBox(
                    width: screenWidth * 0.2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Center align the column
                      children: [
                        // Centered text
                        Text(
                          "9,999",
                          style: CustomTextStyles.titleLargeSFProDisplayGray300,
                          textAlign: TextAlign.center, // Center text
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Center the row
                          children: [
                            Container(
                              height: screenWidth * 0.02,
                              width: screenWidth * 0.02,
                              child: CustomPaint(
                                painter: TrianglePainter(
                                  color: Color(0XFF039C86),
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Text(
                              "10%",
                              style:
                                  CustomTextStyles.labelLargeSFProTextTeal1500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: screenWidth * 0.225,
                      width: screenWidth * 0.225,
                      child: CircularProgressIndicator(
                        value: 0.99,
                        backgroundColor: appTheme.gray90004,
                        strokeWidth: 2.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Avg Stress level: 44%",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.displaySmall!.poppins.copyWith(
                      fontSize: 8.fSize,
                      height: 1.47,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: Text(
                      "Moderate Stress",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.displaySmall!.poppins.copyWith(
                        color: appTheme.lime700,
                        fontSize: 8.fSize,
                        height: 1.47,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    final Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
