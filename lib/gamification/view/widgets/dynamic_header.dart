// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:roughdraft/core/constants/color_constants.dart';
import 'package:roughdraft/core/constants/sizing_constants.dart';

class DynamicHeader extends StatelessWidget {
  const DynamicHeader({Key? key, this.heading = "", this.progressvalue = 0})
    : super(key: key);
  final String heading;
  final double progressvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizing.dynamicHeaderTitlePadding,
      ),
      height: AppSizing.dynamicHeaderHeight,
      width: double.infinity,
      color: Color(AppColors.appBarBackgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Color(AppColors.appBarForegroundColor),
              fontSize: AppSizing.dynamicHeaderTitleSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          if (heading.isNotEmpty)
            LinearProgressIndicator(
              value: progressvalue,
              minHeight: AppSizing.progressBarHeight,
              color: Color(AppColors.progressBarFillColor),
              backgroundColor: Color(AppColors.progressBarBackgroundColor),
              borderRadius: BorderRadius.circular(AppSizing.progressBarRadius),
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
