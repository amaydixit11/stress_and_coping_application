import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class QuizandstreaksectionItemWidget extends StatelessWidget {
  const QuizandstreaksectionItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 166.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.zero,
        color: appTheme.gray90004,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Container(
          height: 120.h,
          width: 166.h,
          decoration: BoxDecoration(
            color: appTheme.gray90004,
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 120.h,
                width: 132.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 102.h,
                  margin: EdgeInsets.only(
                    left: 14.h,
                    top: 12.h,
                  ),
                  child: Text(
                    "Take Today's \nQuiz",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallPoppins.copyWith(
                      height: 1.47,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
