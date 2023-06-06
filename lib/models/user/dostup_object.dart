import 'package:freezed_annotation/freezed_annotation.dart';

part 'dostup_object.freezed.dart';

part 'dostup_object.g.dart';

@freezed
class Dostup_object with _$Dostup_object {
  factory Dostup_object({
    List? quick_check,
    List? my_orders,
  }) = _Dostup_object;

  factory Dostup_object.fromJson(Map<String, dynamic> json) =>
      _$Dostup_objectFromJson(json);
}
