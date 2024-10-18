import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  final Widget? leftIcon;
  final Widget? rightIcon;
  final BoxDecoration? decoration;

  CustomElevatedButton({
    Key? key,
    this.leftIcon,
    this.rightIcon,
    this.decoration,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
    Color? backgroundColor,
  }) : super(
          key: key,
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? 34.h,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration ??
            BoxDecoration(
              color: Color(0xFFFFFFFF), // Background color
              borderRadius:
                  BorderRadius.circular(10), // Optional: Adjust border radius
            ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.transparent, // Set transparent to use your decoration
            shadowColor: Colors.transparent, // Remove shadow
          ),
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? theme.textTheme.bodyLarge,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
