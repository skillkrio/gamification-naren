import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roughdraft/core/constants/color_constants.dart' show AppColors;
import 'package:roughdraft/core/constants/sizing_constants.dart';
import 'package:roughdraft/core/widgets/core_appbar.dart';
import 'package:roughdraft/gamification/model/dynamic_widget_model.dart'
    show DynamicWidgetModel;
import 'package:roughdraft/gamification/view/widgets/dynamic_header.dart';
import 'package:roughdraft/gamification/view/widgets/gender_widget.dart';
import 'package:roughdraft/gamification/view/widgets/name_widget.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

class GamificationGenderScreen extends StatefulWidget {
  const GamificationGenderScreen({super.key, this.prevQuestion = ''});
  final String prevQuestion;

  @override
  State<GamificationGenderScreen> createState() =>
      _GamificationGenderScreenState();
}

class _GamificationGenderScreenState extends State<GamificationGenderScreen> {
  late DynamicWidgetModel dynamicWidgetModel;
  String? gender;
  String heading = '';
  String question = '';
  @override
  void initState() {
    super.initState();
    dynamicWidgetModel = context.read<GamificationController>().widgetModel!;
    setGenderQuestions();
  }

  void setGenderQuestions() {
    int currentIndex = context.read<GamificationController>().index;
    heading = dynamicWidgetModel.screens[currentIndex].heading ?? '';
    question = dynamicWidgetModel.screens[currentIndex].question ?? '';
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
              child: GenderWidget(
                questions: question,
                prevQuestion: widget.prevQuestion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
