import 'package:flutter/material.dart';
import 'package:roughdraft/core/constants/app_constants.dart';
import 'package:roughdraft/core/constants/color_constants.dart';
import 'package:roughdraft/core/constants/sizing_constants.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

class CoreNextButton extends StatelessWidget {
  const CoreNextButton({
    super.key,
    required this.gamificationController,
    this.isSelectedState = false,
  });
  final GamificationController gamificationController;
  final bool isSelectedState;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelectedState
            ? AppColors.nameWidgetNextBtnselectedColor
            : AppColors.nameWidgetNextBtnUnselectedColor,
      ),

      height: AppSizing.nextBtnHeight,
      margin: EdgeInsets.symmetric(vertical: AppSizing.nextBtnMarginVertical),
      child: Center(
        child: Text(
          AppConstants.nextBtnString,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
