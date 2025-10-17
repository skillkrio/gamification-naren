import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roughdraft/core/constants/app_constants.dart';
import 'package:roughdraft/core/constants/color_constants.dart';
import 'package:roughdraft/core/constants/sizing_constants.dart';
import 'package:roughdraft/core/widgets/core_appbar.dart';
import 'package:roughdraft/gamification/model/dynamic_widget_model.dart'
    show DynamicWidgetModel;
import 'package:roughdraft/gamification/view/pages/dashboard_page.dart';
import 'package:roughdraft/gamification/view/widgets/dynamic_header.dart';
import 'package:roughdraft/gamification/view/widgets/name_widget.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

class GamificationNameScreen extends StatefulWidget {
  const GamificationNameScreen({super.key, required this.dynamicWidgetModel});
  final DynamicWidgetModel dynamicWidgetModel;
  @override
  State<GamificationNameScreen> createState() => _GamificationNameScreenState();
}

class _GamificationNameScreenState extends State<GamificationNameScreen> {
  String questions = '';
  String hintText = "";
  String heading = "";
  @override
  void initState() {
    setQuestions();
    super.initState();
  }

  void setQuestions() {
    final pageData = widget.dynamicWidgetModel;
    final index = context.read<GamificationController>().index;
    questions = pageData.screens[index].question ?? "";
    hintText = pageData.screens[index].hintText ?? "";
    heading = pageData.screens[index].heading ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final gamificationController = context.watch<GamificationController>();
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: coreAppBar(context),
        body: Stack(
          children: [
            Positioned(
              child: Container(color: Color((AppColors.appBarBackgroundColor))),
            ),
            Positioned(
              child: DynamicHeader(
                heading: heading,
                progressvalue: gamificationController.progress,
              ),
            ),
            Positioned(
              top: AppSizing.dynamicHeaderHeight,
              width: constraints.maxWidth,
              height:
                  constraints.maxHeight -
                  AppSizing.dynamicHeaderHeight -
                  AppSizing.kToolBarHeight * 1.3,
              child: NameWidget(questions: questions, hintText: hintText),
            ),
          ],
        ),
      ),
    );
  }
}
