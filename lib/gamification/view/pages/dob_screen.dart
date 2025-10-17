import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roughdraft/core/constants/color_constants.dart';
import 'package:roughdraft/core/widgets/core_appbar.dart';
import 'package:roughdraft/gamification/view/widgets/dynamic_header.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

class DobScreen extends StatefulWidget {
  const DobScreen({super.key});

  @override
  State<DobScreen> createState() => _DobScreenState();
}

class _DobScreenState extends State<DobScreen> {
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
                heading: "",
                progressvalue: gamificationController.progress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
