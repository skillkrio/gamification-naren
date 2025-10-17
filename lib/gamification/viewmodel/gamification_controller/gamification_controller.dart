import 'package:flutter/cupertino.dart';
import 'package:roughdraft/gamification/model/dynamic_widget_model.dart';
import 'package:roughdraft/gamification/service/gamification_service.dart';

class GamificationController extends ChangeNotifier {
  final GamificationService _service;

  GamificationController({required GamificationService service})
    : _service = service;
  String? error;
  bool isLoading = false;
  DynamicWidgetModel? widgetModel;
  String? userName;
  String? gender;
  int index = 0;
  double progress = 0;

  Future<void> fetchGamificationDynamicContent() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();
      final dynamicWidget = await _service.fetchDynamicWidgetModel();
      widgetModel = dynamicWidget;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setUserName(String name) {
    if (name.isEmpty) {
      userName = null;
      resetProgressBasedOnIndex();
    } else {
      userName = name;
      recalculateProgress();
    }
    notifyListeners();
  }

  void setGender(String genderVal) {
    if (genderVal.isEmpty) {
      gender = null;
      resetProgressBasedOnIndex();
    } else {
      gender = genderVal;
      recalculateProgress();
    }
    notifyListeners();
  }

  void resetProgressBasedOnIndex() {
    progress = index == 0 ? 0 : (index + 1) * 0.25;
    print("progress:$progress");
    notifyListeners();
  }

  void recalculateProgress() {
    progress = (index + 1) * 0.25;

    print("progress recalculate:$progress");
    notifyListeners();
  }
}
