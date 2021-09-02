import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { paddingLeft, color }

class CustomSwitch extends StatelessWidget {
  final bool checked;
  final Color checkedColor;
  final Color unCheckedColor;
  final Duration animationDuration;
  final Color backgroundColor;
  final double buttonWidth;
  final double buttonHeight;
  final double indicatorWidth;
  final double indicatorBorderRadius;
  final double backgroundBorderRadius;

  const CustomSwitch({
    required this.backgroundColor,
    required this.checked,
    required this.checkedColor,
    required this.unCheckedColor,
    required this.animationDuration,
    this.buttonWidth = 40,
    this.buttonHeight = 20,
    this.indicatorWidth = 13,
    this.indicatorBorderRadius = 25,
    this.backgroundBorderRadius = 30,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(
        AniProps.paddingLeft,
        0.0.tweenTo(buttonWidth / 2),
        animationDuration,
      )
      ..add(
        AniProps.color,
        unCheckedColor.tweenTo(checkedColor),
        animationDuration,
      );

    return CustomAnimation(
      startPosition: checked ? 1.0 : 0.0,
      control: checked
          ? CustomAnimationControl.play
          : CustomAnimationControl.playReverse,
      tween: tween,
      duration: tween.duration * 1.2,
      curve: Curves.easeInOut,
      builder: _buildCheckbox,
    );
  }

  Widget _buildCheckbox(context, child, MultiTweenValues<AniProps> values) {
    return Container(
      decoration: _outerBoxDecoration(backgroundColor),
      width: buttonWidth,
      height: buttonHeight,
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(left: values.get(AniProps.paddingLeft)),
            child: Container(
              decoration: _innerBoxDecoration(values.get(AniProps.color)),
              width: indicatorWidth,
            ),
          ))
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(color) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(indicatorBorderRadius)),
        color: color,
      );

  BoxDecoration _outerBoxDecoration(color) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(backgroundBorderRadius)),
        color: backgroundColor,
      );
}
