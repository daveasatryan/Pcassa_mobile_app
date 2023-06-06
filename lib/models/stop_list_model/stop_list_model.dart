import 'package:freezed_annotation/freezed_annotation.dart';
import '../category_model/category_model.dart';

part 'stop_list_model.freezed.dart';

part 'stop_list_model.g.dart';

@freezed
class StopListModel with _$StopListModel {
  factory StopListModel({
    required String? name,
    required String? description,
    required String? kod_tov,
    required double? quantity,
  }) = _StopListModel;

  factory StopListModel.fromJson(Map<String, dynamic> json) =>
      _$StopListModelFromJson(json);
}
