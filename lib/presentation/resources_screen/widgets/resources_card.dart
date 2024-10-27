import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/core/app_export.dart';

class ResourcesCard extends StatefulWidget {
  final String thumbnail;
  final bool media;
  final String title;
  final String subtitle;
  const ResourcesCard({
    super.key,
    required this.thumbnail,
    required this.media,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ResourcesCard> createState() => _ResourcesCardState();
}

class _ResourcesCardState extends State<ResourcesCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appTheme.gray90004,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    widget.thumbnail,
                    fit: BoxFit.cover,
                    height: screenHeight * 0.2,
                    width: screenHeight * 0.2 * 2.2,
                  ),
                  if (widget.media)
                    Container(
                        color: Colors.black.withOpacity(0.5),
                        height: screenHeight * 0.2,
                        width: screenHeight * 0.2 * 2.2,
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                            ),
                            iconSize: 100,
                            onPressed: () {},
                          ),
                        )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
