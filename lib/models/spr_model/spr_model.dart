import 'package:freezed_annotation/freezed_annotation.dart';

part 'spr_model.freezed.dart';
part 'spr_model.g.dart';

@freezed
class SprModel with _$SprModel {
  factory SprModel({
    String? name,
    String? kod,
  }) = _SprModel;

  const SprModel._();

  factory SprModel.fromJson(Map<String, dynamic> json) =>
      _$SprModelFromJson(json);
}
