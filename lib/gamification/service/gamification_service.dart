import 'package:dio/dio.dart';
import 'package:roughdraft/core/constants/api_constants.dart';
import 'package:roughdraft/gamification/model/dynamic_widget_model.dart'
    show DynamicWidgetModel;

class GamificationService {
  final Dio dio;
  GamificationService({required this.dio});

  Future<DynamicWidgetModel> fetchDynamicWidgetModel() async {
    try {
      final response = await dio.get(ApiConstants.dynamicwidgetPath);
      if (response.statusCode == 200) {
        final DynamicWidgetModel dynamicWidgetModel =
            DynamicWidgetModel.fromJson(response.data);
        return dynamicWidgetModel;
      } else {
        throw Exception("Server Failure");
      }
    } catch (e) {
      rethrow;
    }
  }
}
