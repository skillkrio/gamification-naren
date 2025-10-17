import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roughdraft/gamification/view/pages/gamification_name_screen.dart';
import 'package:roughdraft/gamification/view/widgets/name_widget.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<GamificationController>()
          .fetchGamificationDynamicContent(),
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    final gamificationController = context.watch<GamificationController>();
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (gamificationController.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (gamificationController.widgetModel != null) {
            return GamificationNameScreen(
              dynamicWidgetModel: gamificationController.widgetModel!,
            );
          } else if (gamificationController.error != null) {
            return Center(child: Text(gamificationController.error!));
          }
          return SizedBox();
        },
      ),
    );
  }
}
