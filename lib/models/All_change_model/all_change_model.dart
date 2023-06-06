import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

part 'all_change_model.freezed.dart';
part 'all_change_model.g.dart';

@freezed
class AllChangeModel with _$AllChangeModel {
  factory AllChangeModel({
    required int summa,
    required List<ItemsModel> items,
  }) = _AllChangeModel;

  const AllChangeModel._();

  factory AllChangeModel.fromJson(Map<String, dynamic> json) =>
      _$AllChangeModelFromJson(json);
}
