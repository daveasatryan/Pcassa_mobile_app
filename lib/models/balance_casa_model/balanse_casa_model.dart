import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/All_change_model/items_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/inkas_model.dart';
import 'package:pcassa_retail_mobile/models/balance_casa_model/vnes_model.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

part 'balanse_casa_model.freezed.dart';
part 'balanse_casa_model.g.dart';

@freezed
class BalanseCasaModel with _$BalanseCasaModel {
  factory BalanseCasaModel({
    required int sale,
    required Inkas_model inkass,
    required Vnes_model vnes,
    required int amount,
  }) = _BalanseCasaModel;

  const BalanseCasaModel._();

  factory BalanseCasaModel.fromJson(Map<String, dynamic> json) =>
      _$BalanseCasaModelFromJson(json);
}
