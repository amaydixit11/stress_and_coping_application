import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';
import 'package:stress_and_coping_application/presentation/resources_screen/widgets/resources_card.dart';

class PracticalGuidesScreen extends StatefulWidget {
  const PracticalGuidesScreen({super.key});

  @override
  State<PracticalGuidesScreen> createState() => _PracticalGuidesScreenState();
}

class _PracticalGuidesScreenState extends State<PracticalGuidesScreen> {
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
    ;
  }
}
