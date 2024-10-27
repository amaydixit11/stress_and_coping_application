import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/presentation/resources_screen/widgets/resources_card.dart';

class EducationalContentScreen extends StatefulWidget {
  const EducationalContentScreen({super.key});

  @override
  State<EducationalContentScreen> createState() =>
      _EducationalContentScreenState();
}

class _EducationalContentScreenState extends State<EducationalContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResourcesCard(
          thumbnail: ImageConstant.imgRelaxingMusic,
          title: "hi",
          subtitle: "hi",
          media: true,
        ),
        ResourcesCard(
          thumbnail: ImageConstant.imgRelaxingMusic,
          title: "hi",
          subtitle: "hi",
          media: false,
        ),
        ResourcesCard(
          thumbnail: ImageConstant.imgRelaxingMusic,
          title: "hi",
          subtitle: "hi",
          media: true,
        ),
      ],
    );
  }
}
