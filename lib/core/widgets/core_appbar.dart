import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roughdraft/core/constants/app_constants.dart';
import 'package:roughdraft/core/constants/color_constants.dart';
import 'package:roughdraft/core/constants/sizing_constants.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

AppBar coreAppBar(BuildContext context) => AppBar(
  leading: context.read<GamificationController>().index == 0
      ? null
      : IconButton(
          onPressed: () {
            context.read<GamificationController>().index--;
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
  toolbarHeight: AppSizing.kToolBarHeight,
  backgroundColor: Color(AppColors.appBarBackgroundColor),
  title: Text(
    AppConstants.coreAppbarTitle,
    style: TextStyle(color: Color(AppColors.appBarForegroundColor)),
  ),
  centerTitle: true,
);
