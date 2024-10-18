import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class ListsettingsItemWidget extends StatelessWidget {
  const ListsettingsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.h,
      child: CustomImageView(
        imagePath: ImageConstant.imgSettingsLightBlue100,
        height: 20.h,
        width: 20.h,
      ),
    );
  }
}
