import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcassa_retail_mobile/models/user/dostup_object.dart';

part 'chane_language_model.freezed.dart';
part 'chane_language_model.g.dart';

@freezed
class ChaneLanguageModel with _$ChaneLanguageModel {
  factory ChaneLanguageModel({
    required int id,
    required String login,
    required String fio,
    required String language,
    required Dostup_object dostup,
  }) = _ChaneLanguageModel;

  const ChaneLanguageModel._();

  factory ChaneLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$ChaneLanguageModelFromJson(json);
}
